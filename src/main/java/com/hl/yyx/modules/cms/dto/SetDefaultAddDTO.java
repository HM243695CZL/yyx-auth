package com.hl.yyx.modules.cms.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 设置默认地址DTO
 */
@Data
public class SetDefaultAddDTO {

    @ApiModelProperty("要设置为默认的地址id")
    private Integer selectId;

    @ApiModelProperty("之前的默认地址id")
    private Integer defaultId;
}
