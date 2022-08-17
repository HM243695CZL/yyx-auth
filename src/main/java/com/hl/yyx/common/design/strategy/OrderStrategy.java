package com.hl.yyx.common.design.strategy;

import com.hl.yyx.common.util.OrderHandleOption;

/**
 * 策略模式
 */
public interface OrderStrategy {

    /**
     * 构建订单操作权限
     * @return
     */
    public abstract OrderHandleOption buildOrderAuth();
}
