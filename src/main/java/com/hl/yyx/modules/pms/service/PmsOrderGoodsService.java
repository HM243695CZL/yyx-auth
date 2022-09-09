package com.hl.yyx.modules.pms.service;

import com.hl.yyx.modules.pms.model.PmsOrderGoods;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 订单商品表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-06
 */
public interface PmsOrderGoodsService extends IService<PmsOrderGoods> {

    /**
     * 获取待评价订单商品数量
     * @param orderId
     * @return
     */
    Integer getComments(Integer orderId);
}
