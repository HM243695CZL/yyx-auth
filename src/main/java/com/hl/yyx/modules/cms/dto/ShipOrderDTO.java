package com.hl.yyx.modules.cms.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 订单发货DTO
 */
@Data
public class ShipOrderDTO {

    @ApiModelProperty(value = "发货订单id")
    private Integer orderId;

    @ApiModelProperty(value = "快递单号")
    private String shipSn;

    @ApiModelProperty(value = "发货快递公司")
    private String shipChannel;
}
