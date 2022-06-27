package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.model.PmsGoodsAttributeCategory;
import com.hl.yyx.modules.pms.mapper.PmsGoodsAttributeCategoryMapper;
import com.hl.yyx.modules.pms.service.PmsGoodsAttributeCategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 产品属性分类表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-27
 */
@Service
public class PmsGoodsAttributeCategoryServiceImpl extends ServiceImpl<PmsGoodsAttributeCategoryMapper, PmsGoodsAttributeCategory> implements PmsGoodsAttributeCategoryService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsGoodsAttributeCategory> pageList(PageParamsDTO paramsDTO) {
        Page<PmsGoodsAttributeCategory> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsGoodsAttributeCategory> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }

    /**
     * 删除商品属性分类
     * @param id
     * @return
     */
    @Override
    public boolean delete(String id) {
        // 如果属性数量或参数数量不等于0， 则不允许删除
        PmsGoodsAttributeCategory dataOne = getById(id);
        if (!dataOne.getAttributeCount().equals(0) || !dataOne.getParamCount().equals(0)) {
            Asserts.fail("商品属性数量或商品参数数量不为0， 不能删除");
        }
        return removeById(id);
    }
}
