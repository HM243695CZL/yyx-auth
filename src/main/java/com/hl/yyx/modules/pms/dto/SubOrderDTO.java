package com.hl.yyx.modules.pms.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotBlank;
import java.util.List;

/**
 * 提交订单DTO
 */
@Data
public class SubOrderDTO {

    @ApiModelProperty("地址id")
    private Integer addressId;

    @ApiModelProperty("购物车的数据id")
    private List<Integer> cartIds;

    @ApiModelProperty("订单备注")
    private String message;
}
