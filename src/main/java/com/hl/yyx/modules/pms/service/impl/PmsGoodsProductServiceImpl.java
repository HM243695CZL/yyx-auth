package com.hl.yyx.modules.pms.service.impl;

import com.hl.yyx.modules.pms.model.PmsGoodsProduct;
import com.hl.yyx.modules.pms.mapper.PmsGoodsProductMapper;
import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 商品货品表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
@Service
public class PmsGoodsProductServiceImpl extends ServiceImpl<PmsGoodsProductMapper, PmsGoodsProduct> implements PmsGoodsProductService {

    /**
     * 减少商品库存
     * @param productId 商品id
     * @param number 减少的数量
     * @return
     */
    @Override
    public boolean reduceStock(Integer productId, Integer number) {
        PmsGoodsProduct goodsProduct = getById(productId);
        // 剩余数量
        int surplus = goodsProduct.getNumber() - number;
        goodsProduct.setNumber(surplus);
        updateById(goodsProduct);
        return updateById(goodsProduct);
    }

    /**
     * 增加商品库存
     * @param productId
     * @param number
     * @return
     */
    @Override
    public boolean addStock(Integer productId, Integer number) {
        PmsGoodsProduct product = getById(productId);
        int surplus = product.getNumber() + number;
        product.setNumber(surplus);
        System.out.println(product);
        return updateById(product);
    }
}
