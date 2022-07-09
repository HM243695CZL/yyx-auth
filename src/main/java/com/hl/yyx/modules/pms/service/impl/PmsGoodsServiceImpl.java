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
import com.hl.yyx.modules.pms.service.PmsGoodsAttributeService;
import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.pms.service.PmsGoodsSpecificationService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

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

    @Autowired
    PmsGoodsSpecificationService specificationService;

    @Autowired
    PmsGoodsAttributeService attributeService;

    @Autowired
    PmsGoodsProductService productService;

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsGoods> pageList(PageParamsDTO paramsDTO) {
        Page<PmsGoods> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsGoods> wrapper = new QueryWrapper<>();
        Page<PmsGoods> result = page(page, wrapper);
        for (PmsGoods record : result.getRecords()) {
            record.setDetail(null);
        }
        return result;
    }

    /**
     * 新增商品
     * @param goodsDTO
     * @return
     */
    @Transactional
    @Override
    public Boolean create(GoodsDTO goodsDTO) {
        PmsGoods goods = initGoodsInfo(goodsDTO);
        PmsGoodsAttribute[] attributes = goodsDTO.getAttributes();
        PmsGoodsSpecification[] specifications = goodsDTO.getSpecifications();
        PmsGoodsProduct[] products = goodsDTO.getProducts();

        // 商品基本信息
        boolean result = save(goods);

        // 商品规格信息
        for (PmsGoodsSpecification specification : specifications) {
            specification.setGoodsId(goods.getId());
            specificationService.save(specification);
        }

        // 商品参数信息
        for (PmsGoodsAttribute attribute : attributes) {
            attribute.setGoodsId(goods.getId());
            attributeService.save(attribute);
        }

        // 商品货品信息
        for (PmsGoodsProduct product : products) {
            product.setGoodsId(goods.getId());
            productService.save(product);
        }
        return result;
    }

    @Override
    public HashMap<String, Object> view(String id) {
        PmsGoods goods = getById(id);
        // 商品货品信息
        QueryWrapper<PmsGoodsProduct> productQuery = new QueryWrapper<>();
        productQuery.lambda().eq(PmsGoodsProduct::getGoodsId, id);
        List<PmsGoodsProduct> products = productService.list(productQuery);
        // 商品规格信息
        QueryWrapper<PmsGoodsSpecification> specificationQuery = new QueryWrapper<>();
        specificationQuery.lambda().eq(PmsGoodsSpecification::getGoodsId, id);
        List<PmsGoodsSpecification> specifications = specificationService.list(specificationQuery);
        // 商品参数信息
        QueryWrapper<PmsGoodsAttribute> attributeQuery = new QueryWrapper<>();
        attributeQuery.lambda().eq(PmsGoodsAttribute::getGoodsId, id);
        List<PmsGoodsAttribute> attributes = attributeService.list(attributeQuery);

        HashMap<String, Object> goodsObj = new HashMap<>();
        goodsObj.put("goods", goods);
        goodsObj.put("specifications", specifications);
        goodsObj.put("products", products);
        goodsObj.put("attributes", attributes);
        return goodsObj;
    }

    /**
     * 编辑商品
     *  pms_goods_specification 只能编辑pic_url字段
     *  pms_goods_product 只能编辑price, number, url字段
     *  pms_goods_attribute 可以编辑、添加、删除
     *  如果update_time字段为空，则需要更新数据，操作的记录需要前端将对应的update_time设置为空
     * @param goodsDTO
     * @return
     */
    @Transactional
    @Override
    public Boolean update(GoodsDTO goodsDTO) {
        PmsGoods goods = initGoodsInfo(goodsDTO);
        PmsGoodsSpecification[] specifications = goodsDTO.getSpecifications();
        PmsGoodsAttribute[] attributes = goodsDTO.getAttributes();
        PmsGoodsProduct[] products = goodsDTO.getProducts();

        // 商品基本信息
        boolean result = updateById(goods);

        // 商品规格信息
        for (PmsGoodsSpecification specification : specifications) {
            if (specification.getUpdateTime() == null) {
                // 更新商品规格图片
                specification.setSpecification(null);
                specification.setValue(null);
                specificationService.updateById(specification);
            }
        }

        // 商品参数信息    先清空商品所有的商品参数
        QueryWrapper<PmsGoodsAttribute> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsGoodsAttribute::getGoodsId, goods.getId());
        attributeService.remove(wrapper);
        for (PmsGoodsAttribute attribute : attributes) {
            attribute.setGoodsId(goods.getId());
            attributeService.save(attribute);
        }

        // 商品货品信息
        for (PmsGoodsProduct product : products) {
            if (product.getUpdateTime() == null) {
                // 更新商品货品信息
                productService.updateById(product);
            }
        }

        // 购物车
        // todo
        return result;
    }

    /**
     * 获取微信首页数据
     * @param type 0 不排序 1 add_time降序 2 retail_price升序
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @Override
    public Page<PmsGoods> getHomeGoods(Integer type, Integer pageIndex, Integer pageSize) {
        Page<PmsGoods> page = new Page<>(pageIndex, pageSize);
        QueryWrapper<PmsGoods> queryWrapper = new QueryWrapper<>();
        if (type == 1) {
            queryWrapper.lambda().orderByDesc(PmsGoods::getAddTime);
        } else if (type == 2) {
            queryWrapper.lambda().orderByAsc(PmsGoods::getRetailPrice);
        }
        Page<PmsGoods> result = page(page, queryWrapper);
        for (PmsGoods record : result.getRecords()) {
            record.setDetail(null);
        }
        return result;
    }

    /**
     * 初始化商品信息
     * @param goodsDTO
     * @return
     */
    private PmsGoods initGoodsInfo(GoodsDTO goodsDTO) {
        PmsGoods goods = goodsDTO.getGoods();
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
        return goods;
    }
}
