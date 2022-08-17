package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;

public class OrderDelete implements OrderStrategy{

    /**
     * 如果订单已经取消或是已完成，则可删除
     * @return
     */
    @Override
    public OrderHandleOption buildOrderAuth() {
        OrderHandleOption orderHandleOption = new OrderHandleOption();
        orderHandleOption.setDelete(true);
        return orderHandleOption;
    }
}
