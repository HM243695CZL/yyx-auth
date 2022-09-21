package com.hl.yyx.modules.cms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.cms.dto.FootprintParamsDTO;
import com.hl.yyx.modules.cms.model.CmsFootprint;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 用户浏览足迹表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-18
 */
public interface CmsFootprintMapper extends BaseMapper<CmsFootprint> {

    Page<CmsFootprint> pageList(Page<CmsFootprint> page, @Param("paramsDTO") FootprintParamsDTO paramsDTO);
}
