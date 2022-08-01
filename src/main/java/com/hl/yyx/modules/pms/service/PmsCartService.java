package com.hl.yyx.modules.pms.service;

import com.hl.yyx.modules.pms.dto.CartDTO;
import com.hl.yyx.modules.pms.model.PmsCart;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 购物车商品表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-01
 */
public interface PmsCartService extends IService<PmsCart> {

    Object create(CartDTO cartDTO);
}
