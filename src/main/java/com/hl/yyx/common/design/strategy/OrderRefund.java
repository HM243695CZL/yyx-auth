package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;

public class OrderRefund implements OrderStrategy {

    /**
     * 如果订单已付款，没有发货，则可退款
     * @return
     */
    @Override
    public OrderHandleOption buildOrderAuth() {
        OrderHandleOption handleOption = new OrderHandleOption();
        handleOption.setRefund(true);
        return handleOption;
    }
}
