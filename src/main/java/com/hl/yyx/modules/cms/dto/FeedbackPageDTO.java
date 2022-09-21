package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 意见反馈DTO
 */
@Data
public class FeedbackPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "用户名称")
    private String username;

    @ApiModelProperty(value = "反馈类型")
    private String feedType;
}
