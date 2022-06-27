package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.model.PmsGoodsAttributeCategory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 产品属性分类表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-27
 */
public interface PmsGoodsAttributeCategoryService extends IService<PmsGoodsAttributeCategory> {

    Page<PmsGoodsAttributeCategory> pageList(PageParamsDTO paramsDTO);

    /**
     * 删除商品属性分类
     * @param id
     * @return
     */
    boolean delete(String id);
}
