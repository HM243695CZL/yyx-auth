package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.mapper.UmsAdminMapper;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import com.hl.yyx.modules.ums.model.UmsAdminRole;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.hl.yyx.modules.ums.service.UmsAdminRoleService;
import com.hl.yyx.modules.ums.service.UmsAdminService;
import com.hl.yyx.modules.ums.service.UmsRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-20
 */
@Service
public class UmsAdminServiceImpl extends ServiceImpl<UmsAdminMapper, UmsAdmin> implements UmsAdminService {

    @Autowired
    UmsAdminRoleService adminRoleService;

    @Autowired
    UmsRoleService roleService;

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<UmsAdmin> pageList(PageParamsDTO paramsDTO) {
        Page<UmsAdmin> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        // 根据分页查询用户
        Page<UmsAdmin> pageList = page(page);
        page.getRecords().stream().forEach(
                admin -> {
                    // 根据用户id获取角色id
                    List<Integer> roleIds = adminRoleService.list(new QueryWrapper<UmsAdminRole>().eq("admin_id", admin.getId())
                            .select("role_id")).stream().map(UmsAdminRole::getRoleId).collect(Collectors.toList());
                    if(!ObjectUtil.isEmpty(roleIds)) {
                        // 根据角色表查询对应的角色名称
                        List<String> roleName = roleService.listByIds(roleIds).stream().map(UmsRole::getName).collect(Collectors.toList());
                        admin.setRoles(roleName);
                    }
                }
        );
        return pageList;
    }

    /**
     * 添加用户
     * @param umsAdmin
     * @return
     */
    @Transactional
    @Override
    public boolean create(UmsAdmin umsAdmin) {
        boolean result = save(umsAdmin);
        List<UmsAdminRole> adminRoleList = setAdminAndRole(umsAdmin.getRoleIds(), umsAdmin.getId());
        adminRoleService.saveBatch(adminRoleList);
        return result;
    }

    /**
     * 更新用户
     * @param umsAdmin
     * @return
     */
    @Transactional
    @Override
    public boolean updateAdmin(UmsAdmin umsAdmin) {
        boolean result = updateById(umsAdmin);
        // 清空当前用户的所有角色
        QueryWrapper<UmsAdminRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsAdminRole::getAdminId, umsAdmin.getId());
        adminRoleService.remove(queryWrapper);

        List<UmsAdminRole> adminRoleList = setAdminAndRole(umsAdmin.getRoleIds(), umsAdmin.getId());
        adminRoleService.saveBatch(adminRoleList);

        return result;
    }

    /**
     * 查看用户
     * @param id
     * @return
     */
    @Override
    public UmsAdmin view(String id) {
        UmsAdmin admin = getById(id);
        // 查询用户所有的角色id
        List<Integer> roleIds = adminRoleService.list(new QueryWrapper<UmsAdminRole>().eq("admin_id", id))
                .stream().map(UmsAdminRole::getRoleId).collect(Collectors.toList());
        admin.setRoleIds(roleIds);
        return admin;
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @Transactional
    @Override
    public boolean delete(String id) {
        // 清空当前用户的所有角色
        QueryWrapper<UmsAdminRole> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(UmsAdminRole::getAdminId, id);
        adminRoleService.remove(queryWrapper);
        return removeById(id);
    }

    /**
     * 设置用户和角色的关联关系
     * @param roleList 角色列表
     * @param userId 用户id
     * @return
     */
    public List<UmsAdminRole> setAdminAndRole(List<Integer> roleList, Integer userId) {
        List<UmsAdminRole> adminRoleList = new ArrayList<>();
        for (Integer roleId : roleList) {
            UmsAdminRole adminRole = new UmsAdminRole();
            adminRole.setAdminId(userId);
            adminRole.setRoleId(roleId);
            adminRoleList.add(adminRole);
        }
        return adminRoleList;
    }

}
