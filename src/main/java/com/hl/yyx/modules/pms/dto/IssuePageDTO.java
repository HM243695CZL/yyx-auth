package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 常见问题DTO
 */
@Data
public class IssuePageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "问题内容")
    private String question;
}
