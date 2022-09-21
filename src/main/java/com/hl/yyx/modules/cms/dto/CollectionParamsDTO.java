package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 会员收藏DTO
 */
@Data
public class CollectionParamsDTO extends PageParamsDTO {

    @ApiModelProperty(value = "用户名称")
    private String username;

    @ApiModelProperty(value = "商品名称")
    private String goodsName;
}
