package com.hl.yyx.common.util;

/**
 * 微信响应码
 */
public class WxResponseCode {

    public static final String AUTH_OPENID_UN_ACCESS = "获取openid失败";

    public static final Integer ORDER_UNKNOWN = 720; // 未知订单
    public static final Integer ORDER_INVALID = 721; // 无效订单
    public static final Integer ORDER_CHECKOUT_FAIL = 722; // 订单签出失败
    public static final Integer ORDER_CANCEL_FAIL = 723; // 取消订单失败
    public static final Integer ORDER_PAY_FAIL = 724; // 订单支付失败
    // 订单当前状态下不支持用户的操作，例如商品未发货状态用户执行确认收货是不可能的。
    public static final Integer ORDER_INVALID_OPERATION_CODE = 725; // 订单无效操作
    public static final String ORDER_INVALID_OPERATION = "订单无效操作";
    public static final Integer ORDER_COMMENTED = 726; // 订单评论
    public static final Integer ORDER_COMMENT_EXPIRED = 727; // 订单评论已过期
}
