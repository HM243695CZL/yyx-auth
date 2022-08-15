package com.hl.yyx.modules.pms.dto;

import com.hl.yyx.modules.pms.model.PmsOrder;
import com.hl.yyx.modules.pms.model.PmsOrderGoods;
import lombok.Data;

import java.util.List;

/**
 * 订单分页返回的DTO
 */
@Data
public class OrderPageDTO extends PmsOrder {

    private Integer userId;

    private String userName;

    private String avatar;

    private List<PmsOrderGoods> orderGoodsList;
}
