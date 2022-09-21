package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 搜索历史DTO
 */
@Data
public class SearchHistoryPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "用户名称")
    private String username;

    @ApiModelProperty(value = "搜索关键词")
    private String keyword;
}
