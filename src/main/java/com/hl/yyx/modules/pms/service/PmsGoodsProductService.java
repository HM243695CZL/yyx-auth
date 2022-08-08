package com.hl.yyx.modules.pms.service;

import com.hl.yyx.modules.pms.model.PmsGoodsProduct;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品货品表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
public interface PmsGoodsProductService extends IService<PmsGoodsProduct> {

    boolean reduceStock(Integer productId, Integer number);
}
