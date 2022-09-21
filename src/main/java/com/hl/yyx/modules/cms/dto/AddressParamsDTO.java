package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 收货地址DTO
 */
@Data
public class AddressParamsDTO extends PageParamsDTO {

    @ApiModelProperty(value = "用户名称")
    private String username;

    @ApiModelProperty(value = "收货人名称")
    private String name;
}
