package com.hl.yyx.modules.ums.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.mapper.UmsRoleMapper;
import com.hl.yyx.modules.ums.model.UmsAdminRole;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.hl.yyx.modules.ums.model.UmsRoleMenu;
import com.hl.yyx.modules.ums.service.UmsAdminRoleService;
import com.hl.yyx.modules.ums.service.UmsRoleMenuService;
import com.hl.yyx.modules.ums.service.UmsRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 角色表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-19
 */
@Service
public class UmsRoleServiceImpl extends ServiceImpl<UmsRoleMapper, UmsRole> implements UmsRoleService {

    @Autowired
    UmsAdminRoleService adminRoleService;

    @Autowired
    UmsRoleMenuService roleMenuService;

    /**
     * 分页
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<UmsRole> pageList(PageParamsDTO paramsDTO) {
        Page<UmsRole> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<UmsRole> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }

    /**
     * 删除角色
     * @param id
     * @return
     */
    @Transactional
    @Override
    public boolean delete(String id) {
        // 删除用户角色表的角色
        QueryWrapper<UmsAdminRole> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UmsAdminRole::getRoleId, id);
        adminRoleService.remove(wrapper);
        // 删除角色菜单表的对应角色
        QueryWrapper<UmsRoleMenu> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsRoleMenu::getRoleId, id);
        roleMenuService.remove(queryWrapper);
        return removeById(id);
    }

    /**
     * 授权
     * @param menuIds 菜单id数组
     * @param id 角色id
     * @return
     */
    @Override
    public boolean auth(List<Integer> menuIds, Integer id) {
        List<UmsRoleMenu> roleMenuList = setRoleAndMenuRelation(menuIds, id);
        roleMenuService.saveBatch(roleMenuList);
        return false;
    }

    /**
     * 设置角色和菜单的关联关系
     * @param menuIds
     * @param roleId
     * @return
     */
    public List<UmsRoleMenu> setRoleAndMenuRelation(List<Integer> menuIds, Integer roleId) {
        List<UmsRoleMenu> roleMenuList = new ArrayList<>();
        for (Integer menuId : menuIds) {
            UmsRoleMenu roleMenu = new UmsRoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            roleMenuList.add(roleMenu);
        }
        return roleMenuList;
    }
}
