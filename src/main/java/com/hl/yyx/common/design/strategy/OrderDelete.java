package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;

public class OrderDelete implements OrderStrategy{

    /**
     * 如果订单已经取消或是已完成，则可删除
     * 如果订单已付款，没有发货，则可退款
     * 如果订单已经支付，且已经收货，则可删除、去评论、申请售后和再次购买
     * @return
     */
    @Override
    public OrderHandleOption buildOrderAuth() {
        OrderHandleOption orderHandleOption = new OrderHandleOption();
        orderHandleOption.setDelete(true);
        return orderHandleOption;
    }
}
