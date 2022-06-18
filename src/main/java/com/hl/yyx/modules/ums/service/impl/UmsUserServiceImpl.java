package com.hl.yyx.modules.ums.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.mapper.UmsUserMapper;
import com.hl.yyx.modules.ums.model.UmsUser;
import com.hl.yyx.modules.ums.service.UmsUserService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-18
 */
@Service
public class UmsUserServiceImpl extends ServiceImpl<UmsUserMapper, UmsUser> implements UmsUserService {

    @Override
    public Page pageList(PageParamsDTO paramsDTO) {
        Page<UmsUser> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        return page(page);
    }
}
