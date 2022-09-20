package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 关键字DTO
 */
@Data
public class KeywordPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "关键字")
    private String keyword;
}
