package com.hl.yyx.modules.ums.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.DictListDTO;
import com.hl.yyx.modules.ums.dto.DictPageDTO;
import com.hl.yyx.modules.ums.model.UmsDict;
import com.hl.yyx.modules.ums.mapper.UmsDictMapper;
import com.hl.yyx.modules.ums.service.UmsDictService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-02
 */
@Service
public class UmsDictServiceImpl extends ServiceImpl<UmsDictMapper, UmsDict> implements UmsDictService {

    @Override
    public Page<UmsDict> pageList(DictPageDTO pageDTO) {
        Page<UmsDict> page = new Page<>(pageDTO.getPageIndex(), pageDTO.getPageSize());
        QueryWrapper<UmsDict> wrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(pageDTO.getDateType())) {
            wrapper.lambda().like(UmsDict::getDataType, pageDTO.getDateType());
        }
        if ( StrUtil.isNotEmpty(pageDTO.getDateKey())) {
            wrapper.lambda().like(UmsDict::getDataKey, pageDTO.getDateKey());
        }
        if (StrUtil.isNotEmpty(pageDTO.getDateValue())) {
            wrapper.lambda().like(UmsDict::getDataValue, pageDTO.getDateValue());
        }
        return page(page, wrapper);
    }

    /**
     * 获取字典列表
     * @param listDTO
     * @return
     */
    @Override
    public List<UmsDict> dictList(DictListDTO listDTO) {
        QueryWrapper<UmsDict> wrapper = new QueryWrapper<>();
        if (listDTO.getDateKey() != null) {
            wrapper.lambda().like(UmsDict::getDataKey, listDTO.getDateKey());
        }
        if (listDTO.getDateType() != null) {
            wrapper.lambda().like(UmsDict::getDataType, listDTO.getDateType());
        }
        if (listDTO.getDateValue() != null) {
            wrapper.lambda().like(UmsDict::getDataValue, listDTO.getDateValue());
        }
        return list(wrapper);
    }
}
