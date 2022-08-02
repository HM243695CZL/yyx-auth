package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hl.yyx.common.constants.Constants;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.dto.CartCheckedDTO;
import com.hl.yyx.modules.pms.dto.CartDTO;
import com.hl.yyx.modules.pms.model.PmsCart;
import com.hl.yyx.modules.pms.mapper.PmsCartMapper;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.model.PmsGoodsProduct;
import com.hl.yyx.modules.pms.service.PmsCartService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
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
@Slf4j
@SuppressWarnings("all")
public class PmsCartServiceImpl extends ServiceImpl<PmsCartMapper, PmsCart> implements PmsCartService {

    @Autowired
    PmsGoodsService goodsService;

    @Autowired
    PmsGoodsProductService productService;

    @Autowired
    CmsUserService userService;

    @Autowired
    PmsCartMapper cartMapper;

    /**
     * 加入商品到购物车
     * 如果已存在，则增加数量，否则添加新的货品项
     * @param cartDTO
     * @return
     */
    @Override
    public Object create(CartDTO cartDTO) {
        CmsUser userInfo = getUserInfo();
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
     * 获取购物车信息
     * @return
     */
    @Override
    public Object getCartInfo() {
        CmsUser userInfo = getUserInfo();
        Integer userId = userInfo.getId();
        QueryWrapper<PmsCart> queryWrapper = new QueryWrapper<>();
        // 获取用户的购物车数据
        queryWrapper.lambda().eq(PmsCart::getUserId, userId);
        List<PmsCart> list = list(queryWrapper);
        List<PmsCart> cartList = new ArrayList<>();
        // 自动删除已下架商品
        for (PmsCart cart : list) {
            PmsGoods goods = goodsService.getById(cart.getGoodsId());
            if (goods == null || !goods.getIsOnSale()) {
                removeById(cart.getId());
                log.info("系统自动删除失效购物车商品， goodsId = " + cart.getGoodsId() + " productId = " + cart.getProductId());
            } else {
                cartList.add(cart);
            }
        }
        Integer goodsCount = 0; // 商品数量
        BigDecimal goodsAmount = new BigDecimal("0.00"); // 商品总价
        Integer checkedGoodsCount = 0; // 选中的数量
        BigDecimal checkedGoodsAmount = new BigDecimal("0.00"); // 选中的总价
        for (PmsCart cart : cartList) {
            goodsCount += cart.getNumber();
            goodsAmount = goodsAmount.add(cart.getPrice().multiply(new BigDecimal(cart.getNumber())));
            if (cart.getChecked()) {
                checkedGoodsCount += cart.getNumber();
                checkedGoodsAmount = checkedGoodsAmount.add(cart.getPrice().multiply(new BigDecimal(cart.getNumber())));
            }
        }
        HashMap<String, Object> cartTotal = new HashMap<>();
        cartTotal.put("goodsCount", goodsCount);
        cartTotal.put("goodsAmount", goodsAmount);
        cartTotal.put("checkedGoodsCount", checkedGoodsCount);
        cartTotal.put("checkedGoodsAmount", checkedGoodsAmount);
        HashMap<String, Object> result = new HashMap<>();
        result.put("cartList", cartList);
        result.put("cartTotal", cartTotal);
        return result;
    }

    /**
     * 改变购物车商品货品状态
     * @param checkedDTO
     * @return
     */
    @Transactional
    @Override
    public Object changeChecked(CartCheckedDTO checkedDTO) {
        CmsUser userInfo = getUserInfo();
        Integer userId = userInfo.getId();
        List<Integer> productIds = checkedDTO.getProductIds();
        for (Integer productId : productIds) {
            QueryWrapper<PmsCart> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(PmsCart::getProductId, productId);
            queryWrapper.lambda().eq(PmsCart::getUserId, userId);
            PmsCart cart = getOne(queryWrapper);
            cart.setChecked(checkedDTO.getIsChecked());
            updateById(cart);
        }
        return getCartInfo();
    }

    /**
     * 删除购物车商品
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public Boolean emptyCart(List<Integer> ids) {
        CmsUser userInfo = getUserInfo();
        QueryWrapper<PmsCart> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsCart::getUserId, userInfo.getId());
        for (Integer id : ids) {
            queryWrapper.lambda().eq(PmsCart::getId, id);
            queryWrapper.or();
        }
        int delete = cartMapper.delete(queryWrapper);
        return ids.size() == delete;
    }

    /**
     * 获取用户信息
     * @return
     */
    private CmsUser getUserInfo() {
        return userService.getUserInfo(false);
    }

    /**
     * 获取购物车商品货品数量
     */
    public Object getGoodsCount() {
        CmsUser userInfo = getUserInfo();
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

    /**
     * 获取购物车的商品货品数量
     * @return
     */
    public Integer getCartCount(Integer userId) {
        QueryWrapper<PmsCart> queryWrapper = new QueryWrapper<>();
        // 获取用户的购物车数据
        queryWrapper.lambda().eq(PmsCart::getUserId, userId);
        List<PmsCart> list = list(queryWrapper);
        Integer number = 0;
        for (PmsCart pmsCart : list) {
            number += pmsCart.getNumber();
        }
        return number;
    }
}
