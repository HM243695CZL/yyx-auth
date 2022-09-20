package com.hl.yyx.modules.ums.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户分页DTO
 */
@Data
public class AdminPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "用户名")
    private String username;
}
