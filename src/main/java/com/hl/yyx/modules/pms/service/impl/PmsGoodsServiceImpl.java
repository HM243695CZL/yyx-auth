package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.GoodsDTO;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.mapper.PmsGoodsMapper;
import com.hl.yyx.modules.pms.model.PmsGoodsAttribute;
import com.hl.yyx.modules.pms.model.PmsGoodsProduct;
import com.hl.yyx.modules.pms.model.PmsGoodsSpecification;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;

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
    @Transactional
    @Override
    public boolean create(GoodsDTO goodsDTO) {
        PmsGoods goods = goodsDTO.getGoods();
        PmsGoodsAttribute[] attributes = goodsDTO.getAttributes();
        PmsGoodsSpecification[] specifications = goodsDTO.getSpecifications();
        PmsGoodsProduct[] products = goodsDTO.getProducts();

        // 记录商品的最低价
        BigDecimal retailPrice = new BigDecimal(Integer.MAX_VALUE);
        for (PmsGoodsProduct product : products) {
            BigDecimal price = product.getPrice();
            if (retailPrice.compareTo(price) == 1) {
                retailPrice = price;
            }
        }
        goods.setRetailPrice(retailPrice);

        // 商品基本信息
        save(goods);
        return false;
    }
}
