package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.CollectionParamsDTO;
import com.hl.yyx.modules.cms.model.CmsCollect;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 收藏表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
public interface CmsCollectService extends IService<CmsCollect> {

    Page<CmsCollect> pageList(CollectionParamsDTO paramsDTO);
}
