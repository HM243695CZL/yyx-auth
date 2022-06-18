package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.model.UmsUser;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 用户表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-18
 */
public interface UmsUserService extends IService<UmsUser> {

    Page pageList(PageParamsDTO paramsDTO);
}
