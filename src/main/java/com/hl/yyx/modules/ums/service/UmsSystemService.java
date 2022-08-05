package com.hl.yyx.modules.ums.service;

import com.hl.yyx.modules.ums.model.UmsSystem;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.Map;

/**
 * <p>
 * 系统配置表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-04
 */
public interface UmsSystemService extends IService<UmsSystem> {

    /**
     * 获取运费信息
     * @return
     */
    Object getFreightInfo();

    /**
     * 获取订单配置信息
     * @return
     */
    Object getOrderInfo();

    /**
     * 更新配置信息
     * @param config
     * @return
     */
    Object updateConfig(Map<String, String> config);
}
