package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.GoodsDTO;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.mapper.PmsGoodsMapper;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品基本信息表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
@Service
public class PmsGoodsServiceImpl extends ServiceImpl<PmsGoodsMapper, PmsGoods> implements PmsGoodsService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsGoods> pageList(PageParamsDTO paramsDTO) {
        Page<PmsGoods> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsGoods> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }

    /**
     * 新增商品
     * @param goodsDTO
     * @return
     */
    @Override
    public boolean create(GoodsDTO goodsDTO) {
        return false;
    }
}
