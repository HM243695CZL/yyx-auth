package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.AddressParamsDTO;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 收货地址表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-21
 */
public interface CmsAddressService extends IService<CmsAddress> {

    Page<CmsAddress> pageList(AddressParamsDTO paramsDTO);

    Boolean create(CmsAddress address);

    List<CmsAddress> getAddressList();
}
