package com.hl.yyx.modules.ums.service;

import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 角色表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-19
 */
public interface UmsRoleService extends IService<UmsRole> {

    List<UmsRole> pageList(PageParamsDTO paramsDTO);

    boolean create(UmsRole umsRole);
}
