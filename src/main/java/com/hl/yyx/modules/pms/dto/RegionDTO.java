package com.hl.yyx.modules.pms.dto;

import lombok.Data;

import java.util.List;

/**
 * 行政区域DTO
 */
@Data
public class RegionDTO {

    private Integer id;
    private String code;
    private String value;
    private List<RegionDTO> children;
}
