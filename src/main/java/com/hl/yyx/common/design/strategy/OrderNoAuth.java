package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;

public class OrderNoAuth implements OrderStrategy {

    /**
     * 如果订单申请退款中，没有任何操作
     * @return
     */
    @Override
    public OrderHandleOption buildOrderAuth() {
        OrderHandleOption handleOption = new OrderHandleOption();
        return handleOption;
    }
}
