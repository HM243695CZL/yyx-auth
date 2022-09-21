package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 用户DTO
 */
@Data
public class UserPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "用户昵称")
    private String nickname;
}
