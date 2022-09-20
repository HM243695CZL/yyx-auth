package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.IssuePageDTO;
import com.hl.yyx.modules.pms.model.PmsIssue;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 常见问题表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-11
 */
public interface PmsIssueService extends IService<PmsIssue> {

    Page<PmsIssue> pageList(IssuePageDTO paramsDTO);
}
