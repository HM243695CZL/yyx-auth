package com.hl.yyx.modules.ums.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 字典DTO
 */
@Data
public class DictPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "字典类型")
    private String dateType;

    @ApiModelProperty(value = "字典键")
    private String dateKey;

    @ApiModelProperty(value = "字典值")
    private String dateValue;
}
