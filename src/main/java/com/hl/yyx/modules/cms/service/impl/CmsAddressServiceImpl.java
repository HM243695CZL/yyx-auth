package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.AddressParamsDTO;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.hl.yyx.modules.cms.mapper.CmsAddressMapper;
import com.hl.yyx.modules.cms.service.CmsAddressService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 收货地址表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-21
 */
@Service
public class CmsAddressServiceImpl extends ServiceImpl<CmsAddressMapper, CmsAddress> implements CmsAddressService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<CmsAddress> pageList(AddressParamsDTO paramsDTO) {
        Page<CmsAddress> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<CmsAddress> queryWrapper = new QueryWrapper<>();
        if (paramsDTO.getUserId() != null) {
            queryWrapper.lambda().like(CmsAddress::getUserId, paramsDTO.getUserId());
        }
        if (paramsDTO.getName() != null) {
            queryWrapper.lambda().like(CmsAddress::getName, paramsDTO.getName());
        }
        return page(page, queryWrapper);
    }
}
