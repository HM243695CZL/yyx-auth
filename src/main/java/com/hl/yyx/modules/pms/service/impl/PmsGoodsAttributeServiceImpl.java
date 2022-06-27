package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.GoodsAttrDTO;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.common.vo.ParamsIdsDTO;
import com.hl.yyx.modules.pms.model.PmsGoodsAttribute;
import com.hl.yyx.modules.pms.mapper.PmsGoodsAttributeMapper;
import com.hl.yyx.modules.pms.model.PmsGoodsAttributeCategory;
import com.hl.yyx.modules.pms.service.PmsGoodsAttributeCategoryService;
import com.hl.yyx.modules.pms.service.PmsGoodsAttributeService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * 商品属性参数表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-27
 */
@Service
public class PmsGoodsAttributeServiceImpl extends ServiceImpl<PmsGoodsAttributeMapper, PmsGoodsAttribute> implements PmsGoodsAttributeService {

    @Autowired
    PmsGoodsAttributeCategoryService attributeCategoryService;

    @Resource
    PmsGoodsAttributeMapper attributeMapper;

    /**
     * 分页查询
     * @param goodsAttrDTO
     * @return
     */
    @Override
    public Page<PmsGoodsAttribute> pageList(GoodsAttrDTO goodsAttrDTO) {
        Page<PmsGoodsAttribute> page = new Page<>(goodsAttrDTO.getPageIndex(), goodsAttrDTO.getPageSize());
        QueryWrapper<PmsGoodsAttribute> wrapper = new QueryWrapper<>();
        wrapper.lambda()
                .eq(PmsGoodsAttribute::getProductAttributeCategoryId, goodsAttrDTO.getId())
                .eq(PmsGoodsAttribute::getType, goodsAttrDTO.getType())
                .orderByAsc(PmsGoodsAttribute::getSort);
        return page(page, wrapper);
    }

    /**
     * 新增商品属性
     * @param pmsGoodsAttribute
     * @return
     */
    @Transactional
    @Override
    public boolean create(PmsGoodsAttribute pmsGoodsAttribute) {
        // 保存数据
        boolean result = save(pmsGoodsAttribute);
        if (result) {
            // 更新对应属性的数量
            UpdateWrapper<PmsGoodsAttributeCategory> updateWrapper = new UpdateWrapper<>();
            if (pmsGoodsAttribute.getType() == 0) {
                // 属性
                updateWrapper.setSql("attribute_count = attribute_count + 1");
            } else {
                // 参数
                updateWrapper.setSql("param_count = param_count + 1");
            }
            updateWrapper.lambda().eq(PmsGoodsAttributeCategory::getId, pmsGoodsAttribute.getProductAttributeCategoryId());
            attributeCategoryService.update(updateWrapper);
        }
        return result;
    }

    /**
     * 删除商品属性
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public boolean delete(ParamsIdsDTO ids) {
        PmsGoodsAttribute attribute = null;
        // 获取当前属性的类型
        for (Integer id : ids.getIds()) {
            attribute = getById(id);
            if (attribute != null) {
                break;
            }
        }
        // 删除属性 得到删除后的数量
        int length = attributeMapper.deleteBatchIds(ids.getIds());
        if (length > 0 && attribute != null) {
            // 更新对应属性的数量
            UpdateWrapper<PmsGoodsAttributeCategory> updateWrapper = new UpdateWrapper<>();
            if (attribute.getType() == 0) {
                // 属性
                updateWrapper.setSql("attribute_count = attribute_count - " + length);
            } else {
                // 参数
                updateWrapper.setSql("param_count = param_count - " + length);
            }
            updateWrapper.lambda().eq(PmsGoodsAttributeCategory::getId, attribute.getProductAttributeCategoryId());
            attributeCategoryService.update(updateWrapper);
        }
        return length > 0;
    }
}
