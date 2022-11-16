package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.FormPageDTO;
import com.hl.yyx.modules.ums.model.UmsForm;
import com.hl.yyx.modules.ums.mapper.UmsFormMapper;
import com.hl.yyx.modules.ums.service.UmsFormService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-11-16
 */
@Service
public class UmsFormServiceImpl extends ServiceImpl<UmsFormMapper, UmsForm> implements UmsFormService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<UmsForm> pageList(FormPageDTO paramsDTO) {
        Page<UmsForm> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<UmsForm> queryWrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(paramsDTO.getName())) {
            queryWrapper.lambda().like(UmsForm::getName, paramsDTO.getName());
        }
        if (StrUtil.isNotEmpty(paramsDTO.getFormKey())) {
            queryWrapper.lambda().like(UmsForm::getFormKey, paramsDTO.getFormKey());
        }
        if (StrUtil.isNotEmpty(paramsDTO.getRemark())) {
            queryWrapper.lambda().like(UmsForm::getRemark, paramsDTO.getRemark());
        }
        return page(page, queryWrapper);
    }
}
