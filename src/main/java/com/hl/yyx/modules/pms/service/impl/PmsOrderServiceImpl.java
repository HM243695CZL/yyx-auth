package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.common.task.OrderUnpaidTask;
import com.hl.yyx.common.util.OrderUtil;
import com.hl.yyx.common.task.TaskService;
import com.hl.yyx.common.util.RandomUtil;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsAddressService;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.dto.GoodsPriceAndFreightPriceDTO;
import com.hl.yyx.modules.pms.dto.OrderPageDTO;
import com.hl.yyx.modules.pms.dto.OrderParamsDTO;
import com.hl.yyx.modules.pms.dto.SubOrderDTO;
import com.hl.yyx.modules.pms.mapper.PmsOrderMapper;
import com.hl.yyx.modules.pms.model.PmsCart;
import com.hl.yyx.modules.pms.model.PmsGoodsProduct;
import com.hl.yyx.modules.pms.model.PmsOrder;
import com.hl.yyx.modules.pms.model.PmsOrderGoods;
import com.hl.yyx.modules.pms.service.PmsCartService;
import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.hl.yyx.modules.pms.service.PmsOrderGoodsService;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 * 订单表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-05
 */
@Service
@SuppressWarnings("all")
public class PmsOrderServiceImpl extends ServiceImpl<PmsOrderMapper, PmsOrder> implements PmsOrderService {

    @Autowired
    CmsAddressService addressService;

    @Autowired
    CmsUserService userService;

    @Autowired
    PmsCartService cartService;

    @Autowired
    PmsCartServiceImpl cartServiceImpl;

    @Autowired
    PmsOrderMapper orderMapper;

    @Autowired
    PmsOrderGoodsService orderGoodsService;

    @Autowired
    PmsGoodsProductService productService;

    @Autowired
    TaskService taskService;
    /**
     * 提交订单
     * 1、创建订单表项和订单商品表项
     * 2、删除对应的购物车数据
     * 3、商品货品库存减少
     * @param orderDTO
     * @return
     */
    @Transactional
    @Override
    public Object submitOrder(SubOrderDTO orderDTO) {
        CmsUser userInfo = userService.getUserInfo(false);
        // 收货地址
        CmsAddress address = addressService.getById(orderDTO.getAddressId());
        if (address == null) {
            Asserts.fail("收货地址不能为空");
        }
        // 货品价格
        List<PmsCart> cartList = new ArrayList<>();
        for (Integer cartId : orderDTO.getCartIds()) {
            PmsCart cart = cartService.getById(cartId);
            cartList.add(cart);
        }
        GoodsPriceAndFreightPriceDTO goodsObj = cartServiceImpl.calcGoodsPrice(cartList);
        // 订单费用
        BigDecimal orderTotalPrice = goodsObj.getGoodsPrice().add(goodsObj.getFreightPrice());
        // 支付费用
        BigDecimal actualPrice = orderTotalPrice.subtract(new BigDecimal(0));

        Integer orderId = null;
        // 保存订单
        PmsOrder order = new PmsOrder();
        order.setUserId(userInfo.getId());
        order.setOrderSn(RandomUtil.generateUniqueKey());
        order.setOrderStatus(OrderUtil.STATUS_CREATE);
        order.setConsignee(address.getName());
        order.setMobile(address.getTel());
        order.setMessage(orderDTO.getMessage());
        String detailAddress = address.getProvince() + address.getCity() + address.getCounty() + " " + address.getAddressDetail();
        order.setAddress(detailAddress);
        order.setGoodsPrice(orderTotalPrice);
        order.setFreightPrice(goodsObj.getFreightPrice());
        order.setCouponPrice(new BigDecimal(0));
        order.setIntegralPrice(new BigDecimal(0));
        order.setOrderPrice(orderTotalPrice);
        order.setActualPrice(actualPrice);
        order.setGrouponPrice(new BigDecimal(0));

        orderMapper.insert(order);
        orderId = order.getId();

        // 添加订单商品表项
        for (PmsCart cart : cartList) {
            // 订单商品
            PmsOrderGoods orderGoods = new PmsOrderGoods();
            orderGoods.setOrderId(orderId);
            orderGoods.setGoodsId(cart.getGoodsId());
            orderGoods.setGoodsSn(cart.getGoodsSn());
            orderGoods.setProductId(cart.getProductId());
            orderGoods.setGoodsName(cart.getGoodsName());
            orderGoods.setPicUrl(cart.getPicUrl());
            orderGoods.setNumber(cart.getNumber());
            orderGoods.setPrice(cart.getPrice());
            orderGoods.setSpecifications(cart.getSpecifications());

            orderGoodsService.save(orderGoods);
        }
        // 删除购物车里面的商品信息
        cartService.removeByIds(orderDTO.getCartIds());

        // 商品货品数量减少
        for (PmsCart cart : cartList) {
            Integer productId = cart.getProductId();
            PmsGoodsProduct product = productService.getById(productId);

            int remainNumber = product.getNumber() - cart.getNumber();
            if (remainNumber < 0) {
                Asserts.fail("下单的商品货品数量大于库存量");
            }
            if (!productService.reduceStock(productId, cart.getNumber())) {
                Asserts.fail("商品货品库存减少失败");
            }
        }

        boolean payed = false;
        // 订单支付超期任务
        taskService.addTask(new OrderUnpaidTask(orderId));

        Map<String, Object> result = new HashMap<>();
        result.put("orderId", orderId);
        result.put("payed", payed);
        return result;
    }

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Object list(OrderParamsDTO paramsDTO) {
        List<PmsOrder> pageList = list();
        String nickName = paramsDTO.getNickName();
        QueryWrapper<CmsUser> wrapper = new QueryWrapper<>();
        List<CmsUser> users = userService.list(wrapper.like("nickname", nickName));
        ArrayList<OrderPageDTO> lists = new ArrayList<>();
        OrderPageDTO orderPageDTO = new OrderPageDTO();
        for (PmsOrder record : pageList) {
            for (CmsUser user : users) {
                if (record.getUserId() == user.getId()) {
                    BeanUtil.copyProperties(record, orderPageDTO);
                    orderPageDTO.setUserName(user.getNickname());
                    orderPageDTO.setAvatar(user.getAvatar());
                    QueryWrapper<PmsOrderGoods> query = new QueryWrapper<>();
                    query.lambda().eq(PmsOrderGoods::getOrderId, record.getId());
                    List<PmsOrderGoods> list = orderGoodsService.list(query);
                    orderPageDTO.setOrderGoodsList(list);
                    lists.add(orderPageDTO);
                }
            }
        }
        return lists;
    }
}
