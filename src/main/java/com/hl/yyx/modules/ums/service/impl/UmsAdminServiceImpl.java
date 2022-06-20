package com.hl.yyx.modules.ums.service.impl;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import com.hl.yyx.modules.ums.mapper.UmsAdminMapper;
import com.hl.yyx.modules.ums.service.UmsAdminService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 管理员表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-19
 */
@Service
public class UmsAdminServiceImpl extends ServiceImpl<UmsAdminMapper, UmsAdmin> implements UmsAdminService {

    @Override
    public Page pageList(PageParamsDTO paramsDTO) {
        Page<UmsAdmin> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        return page(page);
    }
}
