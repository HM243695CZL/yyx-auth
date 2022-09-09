package com.hl.yyx.modules.pms.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 申请退款DTO
 */
@Data
public class OrderRefundDTO {

    @ApiModelProperty(value = "订单id")
    private Integer orderId;

    @ApiModelProperty(value = "退款原因")
    private String refundReason;
}
