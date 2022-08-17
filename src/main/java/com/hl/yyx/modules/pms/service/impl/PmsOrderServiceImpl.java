package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.common.task.OrderUnpaidTask;
import com.hl.yyx.common.task.TaskService;
import com.hl.yyx.common.util.OrderHandleOption;
import com.hl.yyx.common.util.OrderUtil;
import com.hl.yyx.common.util.RandomUtil;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsAddressService;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.dto.GoodsPriceAndFreightPriceDTO;
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
import com.hl.yyx.modules.ums.service.impl.UmsSystemServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

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

    @Autowired
    UmsSystemServiceImpl systemService;
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
    public Page<PmsOrder> pageList(OrderParamsDTO paramsDTO) {
        Page<PmsOrder> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        Page<PmsOrder> orderPage = orderMapper.pageList(page, paramsDTO);
        for (PmsOrder record : orderPage.getRecords()) {
            QueryWrapper<PmsOrderGoods> wrapper = new QueryWrapper<>();
            wrapper.lambda().eq(PmsOrderGoods::getOrderId, record.getId());
            List<PmsOrderGoods> list = orderGoodsService.list(wrapper);
            record.setOrderGoodsList(list);
        }
        return orderPage;
    }

    /**
     * 获取订单详情
     * @param orderId
     * @return
     */
    @Override
    public Object getOrderInfo(Integer orderId) throws ParseException {

        PmsOrder orderInfo = getById(orderId);

        QueryWrapper<PmsOrderGoods> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsOrderGoods::getOrderId, orderId);
        List<PmsOrderGoods> orderGoodsList = orderGoodsService.list(wrapper);
        OrderHandleOption handleOption = OrderUtil.build(orderInfo);

        // 获取自动取消订单的时长
        String unpaidMap = systemService.getKeyAndValue("yyx_order_unpaid").get("yyx_order_unpaid");
        // 计算出超时时刻，根据添加时间 + 自动取消时长得出超时的时刻
        Integer unpaid = Integer.parseInt(unpaidMap) * 1000 * 60;
        String formatStr = "yyyy-MM-dd HH:mm:ss";
        String addTimeFormat = DateUtil.format(orderInfo.getAddTime(), formatStr);
        long now = new Date().getTime();
        long time = new SimpleDateFormat(formatStr).parse(addTimeFormat).getTime() + unpaid;
        Date unpairTime = new Date(time);
        String unpairTimeFormat = DateUtil.format(unpairTime, formatStr);

        Map<String, Object> map = new HashMap<>();
        map.put("orderInfo", orderInfo);
        map.put("orderGoodsList", orderGoodsList);
        map.put("handleOption", handleOption);
        map.put("unpairTime", unpairTimeFormat);
        return map;
    }

    /**
     * 支付
     * @param orderId
     * @return
     */
    @Override
    public Object prePay(Integer orderId) {
        PmsOrder order = getById(orderId);
        if (order == null) {
            throw new ApiException("订单不存在");
        }
        // 发起支付

        return null;
    }
}
