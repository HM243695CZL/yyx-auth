package com.hl.yyx.modules.pms.dto;

import lombok.Data;

/**
 * 购物车下单DTO
 */
@Data
public class ShoppingOrderDTO {
    private Integer cartId;
    private Integer addressId;
}
