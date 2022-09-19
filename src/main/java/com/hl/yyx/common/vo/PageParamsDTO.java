package com.hl.yyx.common.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

@Data
public class PageParamsDTO {

    @ApiModelProperty(value = "第几页")
    private Integer pageIndex;

    @ApiModelProperty(value = "每页几条")
    private Integer pageSize;
}
