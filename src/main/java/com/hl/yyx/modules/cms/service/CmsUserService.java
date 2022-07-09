package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.WXAuthDTO;
import com.hl.yyx.modules.cms.dto.WxRegisterDTO;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.baomidou.mybatisplus.extension.service.IService;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

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

    HashMap<Object, Object> accountRegister(WxRegisterDTO registerDTO, HttpServletRequest request);

    Page<CmsUser> pageList(PageParamsDTO paramsDTO);
}
