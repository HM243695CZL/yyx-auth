package com.hl.yyx.config;

import io.swagger.models.auth.In;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

/**
 * 系统配置
 */
public class SystemConfig {
    // 订单相关配置
    public final static String YYX_ORDER_UNPAID = "yyx_order_unpaid"; // 下单多少分钟未付款取消订单
    public final static String YYX_ORDER_UN_CONFIRM = "yyx_order_un_confirm"; // 发货后超多少天未确认自动确认收货
    public final static String YYX_ORDER_COMMENT = "yyx_order_comment"; // 确认收货多少天未评价取消评价资格
    // 运费相关配置
    public final static String YYX_EXPRESS_FREIGHT_VALUE = "yyx_express_freight_value"; // 运费金额
    public final static String YYX_EXPRESS_FREIGHT_MIN = "yyx_express_freight_min"; // 满多少元免运费

    // 所有配置都保存在HashMap中
    private static Map<String, String> SYSTEM_CONFIGS = new HashMap<>();

    private static String getConfig(String key) {
        return SYSTEM_CONFIGS.get(key);
    }

    private static Integer getConfigInt(String key) {
        return Integer.parseInt(SYSTEM_CONFIGS.get(key));
    }

    private static BigDecimal getConfigBigDec(String key) {
        return new BigDecimal(SYSTEM_CONFIGS.get(key));
    }

    /**
     * 获取自动取消订单时长
     * @return
     */
    public static Integer getOrderUnpaid() {
        return getConfigInt(YYX_ORDER_UNPAID);
    }

    /**
     * 获取自动确认收货时长
     * @return
     */
    public static Integer getUnConfirm() {
        return getConfigInt(YYX_ORDER_UN_CONFIRM);
    }

    /**
     * 获取取消评价资格时长
     * @return
     */
    public static Integer getOrderComment() {
        return getConfigInt(YYX_ORDER_COMMENT);
    }

    /**
     * 获取运费金额
     * @return
     */
    public static BigDecimal getFreight() {
        return getConfigBigDec(YYX_EXPRESS_FREIGHT_VALUE);
    }

    /**
     * 获取满免运费的金额
     * @return
     */
    public static BigDecimal getFreightLimit() {
        return getConfigBigDec(YYX_EXPRESS_FREIGHT_MIN);
    }

    public static void setConfigs(Map<String, String> configs) {
        SYSTEM_CONFIGS = configs;
    }

    public static void updateConfigs(Map<String, String> config) {
        for (Map.Entry<String, String> entry : config.entrySet()) {
            SYSTEM_CONFIGS.put(entry.getKey(), entry.getValue());
        }
    }
}
