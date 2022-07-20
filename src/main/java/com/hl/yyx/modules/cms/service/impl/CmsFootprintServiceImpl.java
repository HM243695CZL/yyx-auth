package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.FootprintParamsDTO;
import com.hl.yyx.modules.cms.model.CmsFootprint;
import com.hl.yyx.modules.cms.mapper.CmsFootprintMapper;
import com.hl.yyx.modules.cms.service.CmsFootprintService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户浏览足迹表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-18
 */
@Service
public class CmsFootprintServiceImpl extends ServiceImpl<CmsFootprintMapper, CmsFootprint> implements CmsFootprintService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<CmsFootprint> pageList(FootprintParamsDTO paramsDTO) {
        Page<CmsFootprint> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<CmsFootprint> wrapper = new QueryWrapper<>();
        if (paramsDTO.getUserId() != null) {
            wrapper.lambda().like(CmsFootprint::getUserId, paramsDTO.getUserId());
        }
        if (paramsDTO.getGoodsId() != null) {
            wrapper.lambda().like(CmsFootprint::getGoodsId, paramsDTO.getGoodsId());
        }
        return page(page, wrapper);
    }
}
