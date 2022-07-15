package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.CollectionParamsDTO;
import com.hl.yyx.modules.cms.model.CmsCollect;
import com.hl.yyx.modules.cms.mapper.CmsCollectMapper;
import com.hl.yyx.modules.cms.service.CmsCollectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 收藏表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
@Service
public class CmsCollectServiceImpl extends ServiceImpl<CmsCollectMapper, CmsCollect> implements CmsCollectService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<CmsCollect> pageList(CollectionParamsDTO paramsDTO) {
        Page<CmsCollect> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<CmsCollect> wrapper = new QueryWrapper<>();
        if (paramsDTO.getUserId() != null) {
            wrapper.lambda().like(CmsCollect::getUserId, paramsDTO.getUserId());
        }
        if (paramsDTO.getValueId() != null) {
            wrapper.lambda().like(CmsCollect::getValueId, paramsDTO.getValueId());
        }
        return page(page, wrapper);
    }
}
