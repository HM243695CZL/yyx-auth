package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;

public class OrderCancel implements OrderStrategy{

    /**
     *  如果订单没有被取消，且没有支付，则可支付，可取消
     * @return
     */
    @Override
    public OrderHandleOption buildOrderAuth() {
        OrderHandleOption orderHandleOption = new OrderHandleOption();
        orderHandleOption.setCancel(true);
        orderHandleOption.setPay(true);
        return orderHandleOption;
    }
}
