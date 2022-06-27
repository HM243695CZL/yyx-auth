package com.hl.yyx.common.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotNull;

@Data
public class GoodsAttrDTO extends PageParamsDTO {

    @ApiModelProperty(value = "商品属性分类id")
    @NotNull(message = "商品属性分类id不能为空")
    private Integer id; // 商品属性分类id

    @ApiModelProperty(value = "0 属性 1 参数")
    @NotNull(message = "参数type不能为空")
    private Integer type;
}
