package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.model.PmsBrand;
import com.hl.yyx.modules.pms.mapper.PmsBrandMapper;
import com.hl.yyx.modules.pms.service.PmsBrandService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 品牌商表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-24
 */
@Service
public class PmsBrandServiceImpl extends ServiceImpl<PmsBrandMapper, PmsBrand> implements PmsBrandService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsBrand> pageList(PageParamsDTO paramsDTO) {
        Page<PmsBrand> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsBrand> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }
}
