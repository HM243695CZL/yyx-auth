package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 品牌商DTO
 */
@Data
public class BrandPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "品牌商名称")
    private String name;
}
