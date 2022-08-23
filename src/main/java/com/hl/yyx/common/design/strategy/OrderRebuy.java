package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;

public class OrderRebuy implements OrderStrategy{

    /**
     * 如果订单已经支付，且已经收货，则可删除、去评论、申请售后和再次购买
     * @return
     */
    @Override
    public OrderHandleOption buildOrderAuth() {
        OrderHandleOption handleOption = new OrderHandleOption();
        handleOption.setDelete(true);
        handleOption.setComment(true);
        handleOption.setReBuy(true);
        handleOption.setAfterSale(true);
        return handleOption;
    }
}
