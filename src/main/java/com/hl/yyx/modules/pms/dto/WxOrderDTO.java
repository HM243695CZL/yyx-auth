package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 微信订单DTO
 */
@Data
public class WxOrderDTO extends PageParamsDTO {

    @ApiModelProperty("订单状态")
    private Integer type;
}
