package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.FootprintParamsDTO;
import com.hl.yyx.modules.cms.model.CmsFootprint;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户浏览足迹表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-18
 */
public interface CmsFootprintService extends IService<CmsFootprint> {

    Page<CmsFootprint> pageList(FootprintParamsDTO paramsDTO);

    Object getFootprintList();
}
