package com.hl.yyx.modules.cms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import lombok.Data;

/**
 * 收货地址DTO
 */
@Data
public class AddressParamsDTO extends PageParamsDTO {

    private Integer UserId;
    private String name;
}
