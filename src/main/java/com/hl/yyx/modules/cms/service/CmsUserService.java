package com.hl.yyx.modules.cms.service;

import com.hl.yyx.modules.cms.dto.WXAuthDTO;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-07
 */
public interface CmsUserService extends IService<CmsUser> {

    Object getSessionId(String code);

    Object wxAuthLogin(WXAuthDTO wxAuthDTO, HttpServletRequest request);

    CmsUser getUserInfo(Boolean refresh);
}
