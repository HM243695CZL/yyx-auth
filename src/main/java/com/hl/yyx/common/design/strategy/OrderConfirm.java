package com.hl.yyx.common.design.strategy;


import com.hl.yyx.common.util.OrderHandleOption;

public class OrderConfirm implements OrderStrategy{

    /**
     * 如果订单已经发货，没有收货，则可收货操作,
     * 此时不能取消订单
     * @return
     */
    @Override
    public OrderHandleOption buildOrderAuth() {
        OrderHandleOption handleOption = new OrderHandleOption();
        handleOption.setConfirm(true);
        return handleOption;
    }
}
