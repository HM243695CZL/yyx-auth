package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.model.CmsFeedback;
import com.hl.yyx.modules.cms.mapper.CmsFeedbackMapper;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsFeedbackService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.cms.service.CmsUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 意见反馈表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-27
 */
@Service
public class CmsFeedbackServiceImpl extends ServiceImpl<CmsFeedbackMapper, CmsFeedback> implements CmsFeedbackService {

    @Autowired
    CmsUserService userService;

    @Override
    public Page<CmsFeedback> pageList(PageParamsDTO paramsDTO) {
        Page<CmsFeedback> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<CmsFeedback> queryWrapper = new QueryWrapper<>();
        return page(page, queryWrapper);
    }

    /**
     * 新增反馈
     * @param feedback
     * @return
     */
    @Override
    public Boolean create(CmsFeedback feedback) {
        CmsUser userInfo = userService.getUserInfo(false);
        Integer id = userInfo.getId();
        String username = userInfo.getNickname();
        feedback.setUserId(id);
        feedback.setUsername(username);
        return save(feedback);
    }
}
