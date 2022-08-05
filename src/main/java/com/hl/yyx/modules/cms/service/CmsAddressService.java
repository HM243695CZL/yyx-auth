package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.AddressParamsDTO;
import com.hl.yyx.modules.cms.dto.SetDefaultAddDTO;
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

    Boolean deleteAddress(List<Integer> ids);

    /**
     * 获取用户默认地址
     * @param userId 用户id
     * @return
     */
    CmsAddress getDefaultAddress(Integer userId);

    /**
     * 获取地址详情或默认地址
     * @param addressId 地址id
     * @return
     */
    CmsAddress getAddressInfo(Integer addressId);

    /**
     * 设置默认地址
     * @param defaultAddDTO
     * @return
     */
    Boolean setDefaultAddress(SetDefaultAddDTO defaultAddDTO);
}
