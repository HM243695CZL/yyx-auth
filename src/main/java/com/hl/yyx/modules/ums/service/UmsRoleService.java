package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.dto.AuthMenuDTO;
import com.hl.yyx.modules.ums.dto.RolePageDTO;
import com.hl.yyx.modules.ums.model.UmsRole;

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

    Page<UmsRole> pageList(RolePageDTO paramsDTO);

    boolean delete(String id);

    /**
     * 授权
     * @return
     */
    boolean authMenu(AuthMenuDTO authMenuDTO);

    /**
     * 根据角色id查询已分配的权限
     * @param id
     * @return
     */
    List<Integer> viewAuth(Integer id);
}
