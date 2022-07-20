package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import lombok.Data;

/**
 * 会员足迹DTO
 */
@Data
public class FootprintParamsDTO extends PageParamsDTO {
    private Integer userId;
    private Integer goodsId;
}
