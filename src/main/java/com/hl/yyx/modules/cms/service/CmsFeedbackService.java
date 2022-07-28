package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.model.CmsFeedback;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 意见反馈表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-27
 */
public interface CmsFeedbackService extends IService<CmsFeedback> {

    Page<CmsFeedback> pageList(PageParamsDTO paramsDTO);

    Boolean create(CmsFeedback feedback);
}
