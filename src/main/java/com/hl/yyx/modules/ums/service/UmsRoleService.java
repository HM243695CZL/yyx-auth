package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.common.vo.PageParamsDTO;
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

    Page<UmsRole> pageList(PageParamsDTO paramsDTO);

    boolean delete(String id);

    /**
     * 授权
     * @param menuIds 菜单id数组
     * @param id 角色id
     * @return
     */
    boolean auth(List<Integer> menuIds, Integer id);
}
