package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.common.vo.GoodsAttrDTO;
import com.hl.yyx.common.vo.ParamsIdsDTO;
import com.hl.yyx.modules.pms.model.PmsGoodsAttribute;

import java.util.List;

/**
 * <p>
 * 商品属性参数表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-27
 */
public interface PmsGoodsAttributeService extends IService<PmsGoodsAttribute> {

    Page<PmsGoodsAttribute> pageList(GoodsAttrDTO goodsAttrDTO);

    /**
     * 新增商品属性
     * @param pmsGoodsAttribute
     * @return
     */
    boolean create(PmsGoodsAttribute pmsGoodsAttribute);

    /**
     * 删除商品属性
     * @param ids
     * @return
     */
    boolean delete(ParamsIdsDTO ids);
}
