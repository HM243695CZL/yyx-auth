package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import lombok.Data;

/**
 * 会员收藏DTO
 */
@Data
public class CollectionParamsDTO extends PageParamsDTO {

    private Integer userId;
    private Integer valueId;
}
