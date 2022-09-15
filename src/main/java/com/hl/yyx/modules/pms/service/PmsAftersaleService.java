package com.hl.yyx.modules.pms.service;

import com.hl.yyx.modules.pms.model.PmsAftersale;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 售后表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-11
 */
public interface PmsAftersaleService extends IService<PmsAftersale> {

    /**
     * 订单售后
     * @param aftersale
     * @return
     */
    Boolean orderAfterSale(PmsAftersale aftersale);
}
