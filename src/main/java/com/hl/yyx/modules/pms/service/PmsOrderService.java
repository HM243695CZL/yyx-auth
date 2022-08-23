package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.modules.pms.dto.OrderParamsDTO;
import com.hl.yyx.modules.pms.dto.SubOrderDTO;
import com.hl.yyx.modules.pms.dto.WxOrderDTO;
import com.hl.yyx.modules.pms.model.PmsOrder;

import java.text.ParseException;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-05
 */
public interface PmsOrderService extends IService<PmsOrder> {

    /**
     * 提交订单
     * @param orderDTO
     * @return
     */
    Object submitOrder(SubOrderDTO orderDTO);

    Page<PmsOrder> pageList(OrderParamsDTO paramsDTO);

    /**
     * 获取订单详情
     * @param orderId
     * @return
     */
    Object getOrderInfo(Integer orderId) throws ParseException;

    /**
     * 支付
     * @param orderId
     * @return
     */
    Object prePay(Integer orderId);

    /**
     * 获取订单列表
     * @param paramsDTO
     * @return
     */
     Object getOrderList(WxOrderDTO paramsDTO);

    /**
     * 取消订单
     * @param orderId
     * @return
     */
    Boolean cancelOrder(Integer orderId);

    /**
     * 订单申请退款
     * @param orderId
     * @return
     */
    Boolean refundOrder(Integer orderId);
}
