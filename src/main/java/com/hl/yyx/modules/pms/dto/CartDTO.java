package com.hl.yyx.modules.pms.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 购物车DTO
 */
@Data
public class CartDTO {

    private Integer productId;

    private Integer number;

    private Integer goodsId;
}
