package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.common.express.ExpressService;
import com.hl.yyx.common.task.OrderUnpaidTask;
import com.hl.yyx.common.task.TaskService;
import com.hl.yyx.common.util.OrderHandleOption;
import com.hl.yyx.common.util.OrderUtil;
import com.hl.yyx.common.util.RandomUtil;
import com.hl.yyx.common.util.WxResponseCode;
import com.hl.yyx.modules.cms.dto.ShipOrderDTO;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsAddressService;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.dto.*;
import com.hl.yyx.modules.pms.mapper.PmsCommentMapper;
import com.hl.yyx.modules.pms.mapper.PmsOrderMapper;
import com.hl.yyx.modules.pms.model.*;
import com.hl.yyx.modules.pms.service.*;
import com.hl.yyx.modules.sms.service.SmsMailService;
import com.hl.yyx.modules.ums.model.UmsDict;
import com.hl.yyx.modules.ums.service.UmsDictService;
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

    @Autowired
    SmsMailService mailService;

    @Autowired
    ExpressService expressService;

    @Autowired
    UmsDictService dictService;

    @Autowired
    PmsCommentMapper commentMapper;

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
        order.setGoodsPrice(goodsObj.getGoodsPrice());
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

            // 查询物流的键对应的值信息
            QueryWrapper<UmsDict> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(UmsDict::getDataKey, record.getShipChannel());
            UmsDict dict = dictService.getOne(queryWrapper);
            if (record.getShipChannel() != null) {
                record.setShipChannel(dict.getDataValue());
            }
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
        OrderHandleOption handleOption = OrderUtil.build(order);
        if (!handleOption.isPay()) {
            throw new ApiException(WxResponseCode.ORDER_INVALID_OPERATION);
        }
        // todo 支付逻辑，待申请到商户号
        // 更新订单状态
        order.setOrderStatus(OrderUtil.STATUS_PAY);
        order.setPayId(RandomUtil.generateUniqueKey());
        order.setPayTime(new Date());
        updateById(order);
        HashMap<String, Object> map = new HashMap<>();
        map.put("orderId", order.getId());
        map.put("actualPrice", order.getActualPrice());
        return map;
    }

    /**
     * 获取订单列表
     * type 0 全部订单 1 待付款 2 待发货 3 待收货 4 待评价
     * @param paramsDTO
     * @return
     */
    @Override
    public Object getOrderList(WxOrderDTO paramsDTO) {
        // 转换订单状态
        List<Integer> orderStatus = OrderUtil.orderStatus(paramsDTO.getType());
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<PmsOrder> wrapper = new QueryWrapper<>();
        Page<PmsOrder> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        wrapper.lambda().eq(PmsOrder::getUserId, userInfo.getId());
        if (orderStatus.size() != 0) {
            wrapper.lambda().in(PmsOrder::getOrderStatus, orderStatus);
        }
        wrapper.lambda().orderByDesc(PmsOrder::getUpdateTime);
        Page<PmsOrder> orderPage = page(page, wrapper);

        List<Map<String, Object>> orderVoList = new ArrayList<>();
        for (PmsOrder record : orderPage.getRecords()) {
            HashMap<String, Object> orderVo = new HashMap<>();
            orderVo.put("id", record.getId());
            orderVo.put("orderSn", record.getOrderSn());
            orderVo.put("actualPrice", record.getActualPrice());
            orderVo.put("orderStatusText", OrderUtil.orderStatusText(record));
            orderVo.put("handleOption", OrderUtil.build(record));
            orderVo.put("afterSaleStatus", record.getAftersaleStatus());

            QueryWrapper<PmsOrderGoods> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(PmsOrderGoods::getOrderId, record.getId());
            List<PmsOrderGoods> list = orderGoodsService.list(queryWrapper);
            orderVo.put("orderGoodsList", list);

            orderVoList.add(orderVo);
        }
        return orderVoList;
    }

    /**
     * 取消订单
     * @param orderId
     * @return
     */
    @Transactional
    @Override
    public Boolean cancelOrder(Integer orderId) {
        PmsOrder order = getById(orderId);
        order.setOrderStatus(OrderUtil.STATUS_CANCEL);
        boolean result = updateById(order);
        // 商品货品数量增加
        QueryWrapper<PmsOrderGoods> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsOrderGoods::getOrderId, orderId);
        List<PmsOrderGoods> list = orderGoodsService.list(wrapper);
        for (PmsOrderGoods orderGoods : list) {
            Integer productId = orderGoods.getProductId();
            Integer number = orderGoods.getNumber();
            if (!productService.addStock(productId, number)) {
                throw new ApiException("商品货品库存增加失败");
            }
        }
        return result;
    }

    /**
     * 订单申请退款
     * @param orderId
     * @return
     */
    @Override
    @Transactional
    public Boolean applyRefund(OrderRefundDTO refundDTO) {
        PmsOrder order = getById(refundDTO.getOrderId());
        order.setOrderStatus(OrderUtil.STATUS_REFUND);
        order.setApplyRefundReason(refundDTO.getRefundReason());
        order.setRefundTime(new Date());
        boolean result = updateById(order);
        // todo 发送邮件和短信通知   有用户申请退款，邮件通知运营人员
        mailService.sendSimpleMail("退款申请", OrderUtil.orderToApplyRefundMail(order));
        return result;
    }

    /**
     * 订单退款
     * 1、微信退款操作
     * 2、设置订单退款确认状态
     * 3、订单商品库存回库
     * 从安全角度考虑，采用以下两步
     *  1、管理员登录微信官方支付平台进行退款操作
     *  2、管理员登录本系统点击退款进行订单状态修改和商品库存回库
     * @param id
     * @return
     */
    @Override
    @Transactional
    public Boolean refund(String id) {
        // todo 微信退款操作
        Date now = new Date();
        // 设置订单状态和结束时间
        PmsOrder order = getById(id);
        order.setOrderStatus(OrderUtil.STATUS_REFUND_CONFIRM);
        order.setEndTime(now);
        // 记录订单退款相关信息
        order.setRefundAmount(order.getActualPrice());
        order.setRefundType("微信退款接口");
        order.setRefundContent("微信退款返回的备注信息，【待接入微信支付】");
        order.setRefundTime(now);
        boolean result = updateById(order);

        // 商品货品数量增加
        QueryWrapper<PmsOrderGoods> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsOrderGoods::getOrderId, id);
        List<PmsOrderGoods> list = orderGoodsService.list(wrapper);
        for (PmsOrderGoods orderGoods : list) {
            Integer productId = orderGoods.getProductId();
            Integer number = orderGoods.getNumber();
            if (!productService.addStock(productId, number)) {
                throw new ApiException("商品货品库存增加失败");
            }
        }

        // todo 发送短信通知用户
        // 退款成功通知用户，如"你申请的订单退款【单号：{1}】已成功，请耐心等待到账" 订单号只发后6位
        // 发送邮件通知管理员
        mailService.sendSimpleMail("退款成功", OrderUtil.orderToRefundSuccessMail(order));
        return result;
    }

    /**
     * 订单发货
     * @param shipOrderDTO
     * @return
     */
    @Override
    public Boolean shipOrder(ShipOrderDTO shipOrderDTO) {
        PmsOrder order = getById(shipOrderDTO.getOrderId());
        order.setOrderStatus(OrderUtil.STATUS_SHIP);
        order.setShipSn(shipOrderDTO.getShipSn());
        order.setShipChannel(shipOrderDTO.getShipChannel());
        order.setShipTime(new Date());
        boolean result = updateById(order);

        // todo 发送短信通知用户
        // 发送邮件通知管理员
        // 查询物流对应的中文名
        QueryWrapper<UmsDict> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsDict::getDataKey, shipOrderDTO.getShipChannel());
        UmsDict dict = dictService.getOne(queryWrapper);
        order.setShipChannel(dict.getDataValue());
        mailService.sendSimpleMail("订单发货", OrderUtil.orderToShipMail(order));
        return result;
    }

    /**
     * 确认收货
     * @param orderId
     * @return
     */
    @Override
    public Boolean confirmOrder(Integer orderId) {
        PmsOrder order = getById(orderId);
        Integer comments = orderGoodsService.getComments(orderId);
        order.setComments(comments);
        order.setOrderStatus(OrderUtil.STATUS_CONFIRM);
        order.setConfirmTime(new Date());

        // todo 发送短信通知管理员
        // 发送邮件通知管理员
        mailService.sendSimpleMail("确认收货", OrderUtil.orderToConfirmMail(order));
        return updateById(order);
    }

    /**
     * 评价订单商品
     * @param comment
     * @return
     */
    @Override
    @Transactional
    public Boolean commentGoods(PmsComment comment) {
        CmsUser userInfo = userService.getUserInfo(false);

        Integer commentId = null;

        PmsComment pmsComment = new PmsComment();
        pmsComment.setContent(comment.getContent());
        pmsComment.setHasPicture(comment.getHasPicture());
        pmsComment.setPicUrls(comment.getPicUrls());
        pmsComment.setStar(comment.getStar());
        pmsComment.setType(comment.getType());
        pmsComment.setValueId(comment.getValueId());
        pmsComment.setUserId(userInfo.getId());

        commentMapper.insert(pmsComment);
        commentId = pmsComment.getId();


        // 更新订单商品的评价列表
        PmsOrderGoods orderGoods = orderGoodsService.getById(comment.getOrderGoodsId());
        orderGoods.setComment(commentId);
        orderGoodsService.updateById(orderGoods);

        // 更新订单中未评价的订单商品可评价数量
        Integer orderId = orderGoods.getOrderId();
        PmsOrder order = getById(orderId);
        Integer commentCount = order.getComments();
        if (commentCount > 0) {
            commentCount --;
        }
        order.setComments(commentCount);
        return updateById(order);
    }

    /**
     * 获取PC端订单详情
     * @param id
     * @return
     */
    @Override
    public Object view(String id) {
        PmsOrder order = getById(id);

        CmsUser user = userService.getById(order.getUserId());
        order.setUserName(user.getNickname());
        // 获取物流公司名称
        QueryWrapper<UmsDict> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsDict::getDataKey, order.getShipChannel());
        UmsDict dict = dictService.getOne(queryWrapper);
        if (dict != null) {
            order.setShipName(dict.getDataValue());
        }


        QueryWrapper<PmsOrderGoods> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsOrderGoods::getOrderId, id);
        List<PmsOrderGoods> orderGoodsList = orderGoodsService.list(wrapper);

        HashMap<String, Object> map = new HashMap<>();
        map.put("orderInfo", order);
        map.put("orderGoodsList", orderGoodsList);
        return map;
    }

    /**
     * 更新订单的售后状态
     * @param orderId
     * @param status
     */
    @Override
    public void setOrderAfterSaleStatus(Integer orderId, Integer status) {
        PmsOrder order = getById(orderId);
        order.setAftersaleStatus(status);
        updateById(order);
    }

}
