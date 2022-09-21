package com.hl.yyx.modules.cms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.cms.dto.CollectionParamsDTO;
import com.hl.yyx.modules.cms.model.CmsCollect;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 收藏表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
public interface CmsCollectMapper extends BaseMapper<CmsCollect> {

    Page<CmsCollect> pageList(Page<CmsCollect> page, @Param("paramsDTO") CollectionParamsDTO paramsDTO);
}
