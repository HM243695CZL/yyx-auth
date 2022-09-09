package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 商品评论DTO
 */
@Data
public class CommentPageDto extends PageParamsDTO {

    @ApiModelProperty(value = "商品名称")
    private String goodsName;

    @ApiModelProperty(value = "用户名称")
    private String username;

    @ApiModelProperty(value = "分数")
    private Integer star;

}
