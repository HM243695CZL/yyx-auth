package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.GoodsPageDTO;
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
import java.util.ArrayList;
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
    public Page<PmsGoods> pageList(GoodsPageDTO paramsDTO) {
        Page<PmsGoods> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsGoods> wrapper = new QueryWrapper<>();
        // 按照二级分类id查询商品
        if (paramsDTO.getCategoryId() != null) {
            wrapper.lambda().eq(PmsGoods::getCategoryId, paramsDTO.getCategoryId());
        }
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
        HashMap<String, Object> goodsAndAttribute = getGoodsAndAttribute(id);
        // 商品规格信息
        QueryWrapper<PmsGoodsSpecification> specificationQuery = new QueryWrapper<>();
        specificationQuery.lambda().eq(PmsGoodsSpecification::getGoodsId, id);
        List<PmsGoodsSpecification> specifications = specificationService.list(specificationQuery);

        HashMap<String, Object> goodsObj = new HashMap<>();
        goodsObj.put("goods", goodsAndAttribute.get("goods"));
        goodsObj.put("specifications", specifications);
        goodsObj.put("products", goodsAndAttribute.get("products"));
        goodsObj.put("attributes", goodsAndAttribute.get("attributes"));
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
        // 只查询在售商品
        queryWrapper.lambda().eq(PmsGoods::getIsOnSale, 1);
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
     * 获取商品详情
     * @param goodsId
     * @return
     */
    @Override
    public HashMap<String, Object> wxDetail(String goodsId) {
        HashMap<String, Object> goodsAndAttribute = getGoodsAndAttribute(goodsId);
        // 商品规格信息
        List<VO> specificationList = getSpecificationList(goodsId);
        HashMap<String, Object> goodsWxObj = new HashMap<>();
        goodsWxObj.put("goods", goodsAndAttribute.get("goods"));
        goodsWxObj.put("specificationList", specificationList);
        goodsWxObj.put("products", goodsAndAttribute.get("products"));
        goodsWxObj.put("attributes", goodsAndAttribute.get("attributes"));
        return goodsWxObj;
    }

    /**
     * 获取商品信息   货品信息   参数信息
     * @param goodsId
     * @return
     */
    public HashMap<String, Object> getGoodsAndAttribute(String goodsId) {
        PmsGoods goods = getById(goodsId);
        // 商品货品信息
        QueryWrapper<PmsGoodsProduct> productQuery = new QueryWrapper<>();
        productQuery.lambda().eq(PmsGoodsProduct::getGoodsId, goodsId);
        List<PmsGoodsProduct> products = productService.list(productQuery);
        // 商品参数信息
        QueryWrapper<PmsGoodsAttribute> attributeQuery = new QueryWrapper<>();
        attributeQuery.lambda().eq(PmsGoodsAttribute::getGoodsId, goodsId);
        List<PmsGoodsAttribute> attributes = attributeService.list(attributeQuery);

        HashMap<String, Object> map = new HashMap<>();
        map.put("goods", goods);
        map.put("products", products);
        map.put("attributes", attributes);
        return map;
    }

    /**
     * 获取规格信息
     * @param goodsId
     * @return
     */
    public List<VO> getSpecificationList(String goodsId) {
        QueryWrapper<PmsGoodsSpecification> specificationQuery = new QueryWrapper<>();
        specificationQuery.lambda().eq(PmsGoodsSpecification::getGoodsId, goodsId);
        List<PmsGoodsSpecification> specificationList = specificationService.list(specificationQuery);

        HashMap<String, VO> map = new HashMap<>();

        List<VO> specificationVoList = new ArrayList<>();
        for (PmsGoodsSpecification goodsSpecification : specificationList) {
            String specification = goodsSpecification.getSpecification();
            VO goodsSpecificationVo = map.get(specification);
            if (goodsSpecificationVo == null) {
                goodsSpecificationVo = new VO();
                goodsSpecificationVo.setName(specification);
                List<PmsGoodsSpecification> valueList = new ArrayList<>();
                valueList.add(goodsSpecification);
                goodsSpecificationVo.setValueList(valueList);
                map.put(specification, goodsSpecificationVo);
                specificationVoList.add(goodsSpecificationVo);
            } else {
                List<PmsGoodsSpecification> valueList = goodsSpecificationVo.getValueList();
                valueList.add(goodsSpecification);
            }
        }
        return specificationVoList;
    }

    /**
     * 微信端：构建规格返回数据格式
     */
    private class VO {
        private String name;
        private List<PmsGoodsSpecification> valueList;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public List<PmsGoodsSpecification> getValueList() {
            return valueList;
        }

        public void setValueList(List<PmsGoodsSpecification> valueList) {
            this.valueList = valueList;
        }
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
