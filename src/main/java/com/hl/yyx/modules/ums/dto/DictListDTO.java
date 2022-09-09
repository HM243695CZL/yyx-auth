package com.hl.yyx.modules.ums.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 字典列表DTO
 */
@Data
public class DictListDTO {

    @ApiModelProperty(value = "字典类型")
    private String dateType;

    @ApiModelProperty(value = "字典键")
    private String dateKey;

    @ApiModelProperty(value = "字典值")
    private String dateValue;
}
