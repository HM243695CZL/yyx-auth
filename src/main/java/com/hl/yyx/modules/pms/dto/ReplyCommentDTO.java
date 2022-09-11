package com.hl.yyx.modules.pms.dto;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 回复评论DTO
 */
@Data
public class ReplyCommentDTO {

    @ApiModelProperty(value = "评论的id")
    private Integer id;

    @ApiModelProperty(value = "管理员的回复内容")
    private String adminContent;
}
