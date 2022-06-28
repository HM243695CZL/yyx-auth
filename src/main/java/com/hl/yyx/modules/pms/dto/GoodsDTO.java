package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.model.PmsGoodsAttribute;
import com.hl.yyx.modules.pms.model.PmsGoodsProduct;
import com.hl.yyx.modules.pms.model.PmsGoodsSpecification;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 商品的DTO
 */
@Data
public class GoodsDTO {

    @ApiModelProperty(value = "商品信息")
    PmsGoods goods;

    @ApiModelProperty(value = "商品规格")
    PmsGoodsSpecification[] specification;

    @ApiModelProperty(value = "商品参数")
    PmsGoodsAttribute[] attributes;

    @ApiModelProperty(value = "商品库存")
    PmsGoodsProduct[] products;
}
