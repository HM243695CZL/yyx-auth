package com.hl.yyx.common.util;

import com.hl.yyx.common.design.strategy.*;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.modules.pms.model.PmsOrder;

import java.util.ArrayList;
import java.util.List;

/**
 * 订单常量
 */
public interface OrderUtil {

    public static final Integer STATUS_CREATE = 101; // 订单生成
    public static final Integer STATUS_CANCEL = 102; // 下单未支付用户取消
    public static final Integer STATUS_AUTO_CANCEL = 103; // 下单未支付超期系统自动取消
    public static final Integer STATUS_ADMIN_CANCEL = 104; // 管理员取消
    public static final Integer STATUS_PAY = 201; // 支付完成，商家未发货
    public static final Integer STATUS_REFUND = 202; // 已付款未发货，用户申请退款
    public static final Integer STATUS_REFUND_CONFIRM = 203; // 管理员执行退款操作，确认退款成功
    public static final Integer STATUS_SHIP = 301; // 商家发货，用户未确认
    public static final Integer STATUS_CONFIRM = 401; // 用户确认收货，订单结束
    public static final Integer STATUS_AUTO_CONFIRM = 402; // 超过一定时间，系统自动确认收货


    public static boolean isCreateStatus(PmsOrder order) {
        return OrderUtil.STATUS_CREATE.equals(order.getOrderStatus());
    }

    public static OrderHandleOption build(PmsOrder order) {
        Integer orderStatus = order.getOrderStatus();
        OrderContext orderContext = null;
        switch (orderStatus) {
            case 101:
                orderContext = new OrderContext(new OrderCancel());
                break;
            case 102:
            case 103:
            case 104:
            case 203:
                orderContext = new OrderContext(new OrderDelete());
                break;
            case 201:
                orderContext = new OrderContext(new OrderRefund());
            case 202:
                break;
            case 301:
                orderContext = new OrderContext(new OrderConfirm());
                break;
            case 401:
            case 402:
                orderContext = new OrderContext(new OrderRebuy());
            default:
                throw new ApiException("status不支持");
        }
        return orderContext.buildOrderAuth();
    }

    public static List<Integer> orderStatus(Integer type) {
        List<Integer> status = new ArrayList<>(2);
        switch (type) {
            case 0:
                break;
            case 1:
                // 待付款
                status.add(101);
                break;
            case 2:
                // 待收货
                status.add(201);
                status.add(301);
                break;
            case 3:
                // 待评价
                status.add(401);
                status.add(402);
                break;
            default:
                status = null;
        }
        return status;
    }

    public static String orderStatusText(PmsOrder order) {
        Integer status = order.getOrderStatus();
        String statusText = null;
        switch (status){
            case 101:
                statusText = "未付款";
                break;
            case 102:
                statusText = "已取消";
                break;
            case 103:
                statusText = "已取消(系统)";
                break;
            case 201:
                statusText = "已付款";
                break;
            case 202:
                statusText = "订单取消，退款中";
                break;
            case 203:
                statusText = "已退款";
                break;
            case 301:
                statusText = "已发货";
                break;
            case 401:
                statusText = "已收货";
                break;
            case 402:
                statusText = "已收货(系统)";
                break;
            default:
                statusText = "";
        }
        return statusText;
    }
}
