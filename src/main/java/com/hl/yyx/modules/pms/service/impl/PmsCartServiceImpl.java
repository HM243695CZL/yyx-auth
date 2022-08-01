package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hl.yyx.common.constants.Constants;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.dto.CartDTO;
import com.hl.yyx.modules.pms.model.PmsCart;
import com.hl.yyx.modules.pms.mapper.PmsCartMapper;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.model.PmsGoodsProduct;
import com.hl.yyx.modules.pms.service.PmsCartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 购物车商品表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-01
 */
@Service
public class PmsCartServiceImpl extends ServiceImpl<PmsCartMapper, PmsCart> implements PmsCartService {

    @Autowired
    PmsGoodsService goodsService;

    @Autowired
    PmsGoodsProductService productService;

    @Autowired
    CmsUserService userService;

    /**
     * 加入商品到购物车
     * 如果已存在，则增加数量，否则添加新的货品项
     * @param cartDTO
     * @return
     */
    @Override
    public Object create(CartDTO cartDTO) {
        CmsUser userInfo = userService.getUserInfo(false);
        Integer userId = userInfo.getId();
        // 判断商品是否可以购买
        PmsGoods goods = goodsService.getById(cartDTO.getGoodsId());
        if (goods == null || !goods.getIsOnSale()) {
            Asserts.fail(Constants.GOODS_NOT_IS_ON_SALE);
        }
        PmsGoodsProduct product = productService.getById(cartDTO.getProductId());
        // 判断购物车是否存在此规格商品
        PmsCart existCart = getCartByGoodsIdAndProductId(cartDTO.getGoodsId(), cartDTO.getProductId());
        if (existCart == null) {
            // 获取规格信息，判断规格库存
            if (product == null || cartDTO.getNumber() > product.getNumber()) {
                Asserts.fail(Constants.GOODS_NO_STOCK);
            }
            PmsCart cart = new PmsCart();
            cart.setId(null);
            cart.setProductId(cartDTO.getProductId());
            cart.setNumber(cartDTO.getNumber());
            cart.setGoodsId(cartDTO.getGoodsId());
            cart.setGoodsSn(goods.getGoodsSn());
            cart.setGoodsName(goods.getName());
            if (StrUtil.isEmpty(product.getUrl())) {
                cart.setPicUrl(goods.getPicUrl());
            } else {
                cart.setPicUrl(product.getUrl());
            }
            cart.setPrice(product.getPrice());
            cart.setSpecifications(product.getSpecifications());
            cart.setUserId(userId);
            cart.setChecked(true);
            save(cart);
        } else {
            int num = existCart.getNumber() + cartDTO.getNumber();
            if (num > product.getNumber()) {
                Asserts.fail(Constants.GOODS_NO_STOCK);
            }
            existCart.setNumber(num);
        }
        return getGoodsCount();
    }

    /**
     * 获取购物车商品货品数量
     */
    public Object getGoodsCount() {
        CmsUser userInfo = userService.getUserInfo(false);
        Integer userId = userInfo.getId();
        int goodsCount = 0;
        QueryWrapper<PmsCart> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsCart::getUserId, userId);
        List<PmsCart> cartList = list(queryWrapper);
        for (PmsCart cart : cartList) {
            goodsCount += cart.getNumber();
        }
        return goodsCount;
    }

    /**
     * 根据商品id和货品id查询购物车数据
     * @return
     */
    public PmsCart getCartByGoodsIdAndProductId(Integer goodsId, Integer productId) {
        QueryWrapper<PmsCart> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsCart::getGoodsId, goodsId);
        queryWrapper.lambda().eq(PmsCart::getProductId, productId);
        return getOne(queryWrapper);
    }
}
