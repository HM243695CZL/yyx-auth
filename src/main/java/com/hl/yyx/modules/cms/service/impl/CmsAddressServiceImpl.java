package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.AddressParamsDTO;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.hl.yyx.modules.cms.mapper.CmsAddressMapper;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsAddressService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.cms.service.CmsUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 * 收货地址表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-21
 */
@Service
@SuppressWarnings("all")
public class CmsAddressServiceImpl extends ServiceImpl<CmsAddressMapper, CmsAddress> implements CmsAddressService {

    @Autowired
    CmsUserService userService;

    @Autowired
    CmsAddressMapper addressMapper;
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

    /**
     * 新增收货地址
     * @param address
     * @return
     */
    @Override
    public Boolean create(CmsAddress address) {
        CmsUser userInfo = userService.getUserInfo(false);
        address.setUserId(userInfo.getId());
        return save(address);
    }

    /**
     * 获取收货地址列表
     * @return
     */
    @Override
    public List<CmsAddress> getAddressList() {
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<CmsAddress> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(CmsAddress::getUserId, userInfo.getId());
        wrapper.lambda().orderByDesc(CmsAddress::getUpdateTime);
        return list(wrapper);
    }

    /**
     * 删除地址
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public Boolean deleteAddress(List<Integer> ids) {
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<CmsAddress> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(CmsAddress::getUserId, userInfo.getId());
        for (Integer id : ids) {
            queryWrapper.lambda().eq(CmsAddress::getId, id);
            queryWrapper.or();
        }
        int delete = addressMapper.delete(queryWrapper);
        return ids.size() == delete;
    }
}
