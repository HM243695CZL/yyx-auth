package com.hl.yyx.modules.pms.dto;

import lombok.Data;

import java.math.BigDecimal;

/**
 * 商品价格和运费
 */
@Data
public class GoodsPriceAndFreightPriceDTO {

    private BigDecimal goodsPrice;

    private BigDecimal freightPrice;
}
