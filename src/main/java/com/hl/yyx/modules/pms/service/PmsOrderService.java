package com.hl.yyx.modules.pms.service;

import com.hl.yyx.modules.pms.dto.SubOrderDTO;
import com.hl.yyx.modules.pms.model.PmsOrder;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 订单表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-05
 */
public interface PmsOrderService extends IService<PmsOrder> {

    /**
     * 提交订单
     * @param orderDTO
     * @return
     */
    Object submitOrder(SubOrderDTO orderDTO);
}
