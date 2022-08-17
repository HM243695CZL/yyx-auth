package com.hl.yyx.common.util;

import com.hl.yyx.common.design.strategy.OrderCancel;
import com.hl.yyx.common.design.strategy.OrderContext;
import com.hl.yyx.common.design.strategy.OrderDelete;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.modules.pms.model.PmsOrder;

/**
 * 订单常量
 */
public interface OrderUtil {

    public static final Integer STATUS_CREATE = 101; // 订单生成
    public static final Integer STATUS_CANCEL = 102; // 下单未支付用户取消
    public static final Integer STATUS_AUTO_CANCEL = 103; // 下单未支付超期系统自动取消
    public static final Integer STATUS_ADMIN_CANCEL = 104; // 管理员取消
    public static final Integer STATUS_PAY = 201; // 支付完成，商家未发货
    public static final Integer STATUS_REFUND = 201; // 已付款未发货，用户申请退款
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
                orderContext = new OrderContext(new OrderDelete());
                break;
            default:
                throw new ApiException("status不支持");
        }
        return orderContext.buildOrderAuth();
    }
}
