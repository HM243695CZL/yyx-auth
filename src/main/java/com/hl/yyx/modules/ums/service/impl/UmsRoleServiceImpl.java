package com.hl.yyx.modules.ums.service.impl;

import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.hl.yyx.modules.ums.mapper.UmsRoleMapper;
import com.hl.yyx.modules.ums.service.UmsRoleService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;
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

    @Resource
    private UmsRoleMapper roleMapper;

    @Override
    public List<UmsRole> pageList(PageParamsDTO paramsDTO) {
        List<UmsRole> page = roleMapper.page(paramsDTO.getPageIndex() - 1, paramsDTO.getPageSize());
        return page;
    }

    @Override
    public boolean create(UmsRole umsRole) {
        umsRole.setEnabled(true);
        umsRole.setAddTime(new Date());
        umsRole.setUpdateTime(new Date());
        umsRole.setDeleted(false);
        return roleMapper.create(umsRole);
    }
}
