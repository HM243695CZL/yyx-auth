package com.hl.yyx.modules.ums.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 角色DTO
 */
@Data
public class RolePageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "角色名称")
    private String name;
}
