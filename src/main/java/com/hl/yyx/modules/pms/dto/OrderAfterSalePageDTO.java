package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 订单售后DTO
 */
@Data
public class OrderAfterSalePageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "售后编号")
    private String afterSaleSn;

    @ApiModelProperty(value = "用户名称")
    private String username;

    @ApiModelProperty(value = "售后状态")
    private Integer status;

    @ApiModelProperty(value = "售后类型")
    private Integer type;
}
