package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.modules.ums.dto.InitMenuDTO;
import com.hl.yyx.modules.ums.dto.MenuMataDTO;
import com.hl.yyx.modules.ums.mapper.UmsMenuMapper;
import com.hl.yyx.modules.ums.model.UmsAdminRole;
import com.hl.yyx.modules.ums.model.UmsMenu;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.hl.yyx.modules.ums.model.UmsRoleMenu;
import com.hl.yyx.modules.ums.service.UmsAdminRoleService;
import com.hl.yyx.modules.ums.service.UmsMenuService;
import com.hl.yyx.modules.ums.service.UmsRoleMenuService;
import com.hl.yyx.modules.ums.service.UmsRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 菜单表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-21
 */
@Service
public class UmsMenuServiceImpl extends ServiceImpl<UmsMenuMapper, UmsMenu> implements UmsMenuService {

    @Autowired
    private UmsRoleMenuService roleMenuService;

    @Autowired
    private UmsRoleService roleService;

    @Autowired
    private UmsAdminRoleService adminRoleService;

    /**
     * 新增菜单
     * @param umsMenu
     * @return
     */
    @Transactional
    @Override
    public boolean create(UmsMenu umsMenu) {
        boolean result = save(umsMenu);
        List<UmsRoleMenu> roleMenuList = setRoleAndMenuRelation(umsMenu.getRoleIds(), umsMenu.getId());
        roleMenuService.saveBatch(roleMenuList);
        return result;
    }

    /**
     * 获取树形菜单
     * @return
     */
    @Override
    public List<UmsMenu> getMenuList() {
        // 获取所有菜单
        List<UmsMenu> menuLst = list();
        // 给菜单设置关联的角色
        menuLst.stream().forEach(menu -> {
            // 根据菜单id获取角色id
            List<Integer> roleIds = roleMenuService.list(new QueryWrapper<UmsRoleMenu>().eq("menu_id", menu.getId()).select("role_id"))
                    .stream().map(UmsRoleMenu::getRoleId).collect(Collectors.toList());
            if (!ObjectUtil.isEmpty(roleIds)) {
                // 根据角色表查询对应的角色key和角色id
                List<String> roleKey = roleService.listByIds(roleIds).stream().map(UmsRole::getKey).collect(Collectors.toList());
                menu.setRoles(roleKey);
                menu.setRoleIds(roleIds);
            }
        });
       return buildMenuTree(menuLst);
    }

    /**
     * 查看菜单
     * @param id
     * @return
     */
    @Override
    public UmsMenu view(String id) {
        UmsMenu menu = getById(id);
        // 获取菜单对应的角色id
        List<Integer> roleIds = roleMenuService.list(new QueryWrapper<UmsRoleMenu>().eq("menu_id", id).select("role_id"))
                .stream().map(UmsRoleMenu::getRoleId).collect(Collectors.toList());
        menu.setRoleIds(roleIds);
        return menu;
    }

    /**
     * 更新菜单
     * @param umsMenu
     * @return
     */
    @Transactional
    @Override
    public boolean updateMenu(UmsMenu umsMenu) {
        boolean result = updateById(umsMenu);
        // 清空菜单对应的所有角色
        QueryWrapper<UmsRoleMenu> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsRoleMenu::getMenuId, umsMenu.getId());
        roleMenuService.remove(queryWrapper);

        List<UmsRoleMenu> roleMenuList = setRoleAndMenuRelation(umsMenu.getRoleIds(), umsMenu.getId());
        roleMenuService.saveBatch(roleMenuList);
        return result;
    }

    /**
     * 删除菜单
     * @param id id
     * @return
     */
    @Transactional
    @Override
    public boolean delete(String id) {
        // 如果存在子菜单， 则不能删除
        QueryWrapper<UmsMenu> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(UmsMenu::getPid, id);
        UmsMenu menu = getOne(wrapper);
        if (ObjectUtil.isNotNull(menu)) {
            throw new ApiException("当前菜单存在子菜单，不能删除");
        }
        // 清空菜单对应的所有角色
        QueryWrapper<UmsRoleMenu> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsRoleMenu::getMenuId, id);
        roleMenuService.remove(queryWrapper);
        return removeById(id);
    }

    /**
     * 根据用户id获取用户菜单
     * @param userId 用户id
     * @return
     */
    @Override
    public List<InitMenuDTO> getMenuListByUserId(Integer userId) {
        ArrayList<InitMenuDTO> dataList = new ArrayList<>();
        List<InitMenuDTO> menus = new ArrayList<>();
        // 获取用户对应的角色id
        List<Integer> roleIds = adminRoleService.list(new QueryWrapper<UmsAdminRole>().eq("admin_id", userId).select("role_id"))
                .stream().map(UmsAdminRole::getRoleId).collect(Collectors.toList());
        // 根据角色id查询对应的菜单id
        List<Integer> menuIds = roleMenuService.list(new QueryWrapper<UmsRoleMenu>().in("role_id", roleIds).select("menu_id"))
                .stream().map(UmsRoleMenu::getMenuId).collect(Collectors.toList());
        // 根据菜单id查询出菜单
        list(new QueryWrapper<UmsMenu>().in("id", menuIds))
                .stream().forEach(menuItem -> {
                    // 根据角色表查询对应的角色key
            List<String> roleKey = roleService.listByIds(roleIds).stream().map(UmsRole::getKey).collect(Collectors.toList());
            InitMenuDTO initMenuDTO = new InitMenuDTO();
            MenuMataDTO menuMataDTO = new MenuMataDTO();
            // 设置meta
            menuMataDTO.setTitle(menuItem.getTitle());
            menuMataDTO.setIsLink(menuItem.getIsLink());
            menuMataDTO.setIsHide(menuItem.getIsHide());
            menuMataDTO.setIsKeepAlive(menuItem.getIsKeepAlive());
            menuMataDTO.setIsAffix(menuItem.getIsAffix());
            menuMataDTO.setIsIframe(menuItem.getIsIframe());
            menuMataDTO.setRoles(roleKey);
            menuMataDTO.setIcon(menuItem.getIcon());

            initMenuDTO.setId(menuItem.getId());
            initMenuDTO.setPid(menuItem.getPid());
            initMenuDTO.setPath(menuItem.getPath());
            initMenuDTO.setName(menuItem.getName());
            initMenuDTO.setComponent(menuItem.getComponent());
            initMenuDTO.setMeta(menuMataDTO);
            menus.add(initMenuDTO);
        });
        // 找到父节点
        for (InitMenuDTO menu : menus) {
            if (ObjectUtil.isEmpty(menu.getPid())) {
                menu.setChildren(new ArrayList<InitMenuDTO>());
                dataList.add(menu);
            }
        }
        // 根据父节点找到子节点
        for (InitMenuDTO menu : dataList) {
            menu.getChildren().add(findInitMenuChildren(menu, menus));
        }
        return dataList;
    }

    private InitMenuDTO findInitMenuChildren(InitMenuDTO menu, List<InitMenuDTO> menus) {
        menu.setChildren(new ArrayList<>());
        for (InitMenuDTO item : menus) {
            if (menu.getId().equals(item.getPid())) {
                menu.getChildren().add(findInitMenuChildren(item, menus));
            }
        }
        return menu;
    }

    /**
     * 构建菜单树结构
     * @return
     */
    public List<UmsMenu> buildMenuTree(List<UmsMenu> menus) {
        ArrayList<UmsMenu> dataList = new ArrayList<>();
        // 找到父节点
        for (UmsMenu menu : menus) {
            if(ObjectUtil.isEmpty(menu.getPid())) {
                menu.setChildren(new ArrayList<UmsMenu>());
                dataList.add(menu);
            }
        }
        // 根据父节点找到子节点
        for (UmsMenu menu : dataList) {
            menu.getChildren().add(findMenuChildren(menu, menus));
        }
        return dataList;
    }

    /**
     * 递归菜单
     * @param menu 父级菜单
     * @param menuLst 菜单列表
     * @return
     */
    private UmsMenu findMenuChildren(UmsMenu menu, List<UmsMenu> menuLst) {
        menu.setChildren(new ArrayList<>());
        for (UmsMenu item : menuLst) {
            if (menu.getId().equals(item.getPid())) {
                menu.getChildren().add(findMenuChildren(item, menuLst));
            }
        }
        return menu;
    }

    /**
     * 设置角色和菜单的关联关系
     * @param roleIds 角色id数组
     * @param menuId 菜单id
     * @return
     */
    public List<UmsRoleMenu> setRoleAndMenuRelation(List<Integer> roleIds, Integer menuId) {
        List<UmsRoleMenu> roleMenuList = new ArrayList<>();
        for (Integer roleId : roleIds) {
            UmsRoleMenu roleMenu = new UmsRoleMenu();
            roleMenu.setRoleId(roleId);
            roleMenu.setMenuId(menuId);
            roleMenuList.add(roleMenu);
        }
        return roleMenuList;
    }
}
