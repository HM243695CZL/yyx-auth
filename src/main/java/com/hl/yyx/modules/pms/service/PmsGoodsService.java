package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.GoodsDTO;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 商品基本信息表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
public interface PmsGoodsService extends IService<PmsGoods> {

    Page<PmsGoods> pageList(PageParamsDTO paramsDTO);

    boolean create(GoodsDTO goodsDTO);
}
