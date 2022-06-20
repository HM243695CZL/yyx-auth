package com.hl.yyx.modules.ums.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.mapper.UmsRoleMapper;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.hl.yyx.modules.ums.service.UmsRoleService;
import org.springframework.stereotype.Service;

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

    @Override
    public Page<UmsRole> pageList(PageParamsDTO paramsDTO) {
        Page<UmsRole> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<UmsRole> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }
}
