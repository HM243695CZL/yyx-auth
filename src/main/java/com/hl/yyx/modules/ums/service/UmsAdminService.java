package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.model.UmsAdmin;

/**
 * <p>
 * 管理员表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-20
 */
public interface UmsAdminService extends IService<UmsAdmin> {

    Page<UmsAdmin> pageList(PageParamsDTO paramsDTO);

    boolean create(UmsAdmin umsAdmin);

    boolean updateAdmin(UmsAdmin umsAdmin);

    UmsAdmin view(String id);

    boolean delete(String id);
}
