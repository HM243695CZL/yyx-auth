package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;
import lombok.Data;

@Data
public class OrderContext {

    private OrderStrategy orderStrategy;

    public OrderContext(OrderStrategy orderStrategy) {
        super();
        this.orderStrategy = orderStrategy;
    }

    public OrderHandleOption buildOrderAuth(){
        return orderStrategy.buildOrderAuth();
    }
}
