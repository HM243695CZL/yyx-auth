package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.modules.ums.dto.FormPageDTO;
import com.hl.yyx.modules.ums.model.UmsForm;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-11-16
 */
public interface UmsFormService extends IService<UmsForm> {

    Page<UmsForm> pageList(FormPageDTO paramsDTO);
}
