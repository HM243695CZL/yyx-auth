package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.pms.dto.OrderAfterSalePageDTO;
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

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    Page<PmsAftersale> pageList(OrderAfterSalePageDTO paramsDTO);

    /**
     * 根据订单id获取订单商品列表
     * @param paramsDTO
     * @return
     */
    Page<PmsAftersale> getAfterSaleList(OrderAfterSalePageDTO paramsDTO);

    /**
     * 根据订单id获取售后详情
     * @param orderId
     * @return
     */
    Object getAfterSaleInfo(String orderId);
}
