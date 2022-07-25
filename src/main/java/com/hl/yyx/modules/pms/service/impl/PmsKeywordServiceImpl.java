package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.model.PmsKeyword;
import com.hl.yyx.modules.pms.mapper.PmsKeywordMapper;
import com.hl.yyx.modules.pms.service.PmsKeywordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 关键字表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
@Service
public class PmsKeywordServiceImpl extends ServiceImpl<PmsKeywordMapper, PmsKeyword> implements PmsKeywordService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsKeyword> pageList(PageParamsDTO paramsDTO) {
        Page<PmsKeyword> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsKeyword> queryWrapper = new QueryWrapper<>();
        return page(page, queryWrapper);
    }
}
