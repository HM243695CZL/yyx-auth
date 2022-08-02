package com.hl.yyx.modules.pms.dto;

import lombok.Data;

import java.util.List;

/**
 * 改变购物车商品货品状态DTO
 */
@Data
public class CartCheckedDTO {

    private Boolean isChecked;
    private List<Integer> productIds;
}
