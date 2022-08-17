package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 订单分页查询DTO
 */
@Data
public class OrderParamsDTO extends PageParamsDTO {

    @ApiModelProperty("订单编号")
    private String orderSn;

    @ApiModelProperty("收货人")
    private String consignee;

    @ApiModelProperty("下单用户")
    private String nickName;

    @ApiModelProperty("订单状态")
    private Integer orderStatus;
}
