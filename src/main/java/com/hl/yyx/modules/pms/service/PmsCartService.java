package com.hl.yyx.modules.pms.service;

import com.hl.yyx.modules.pms.dto.CartCheckedDTO;
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

    /**
     * 添加购物车
     * @param cartDTO
     * @return
     */
    Object create(CartDTO cartDTO);

    /**
     * 获取购物车信息
     * @return
     */
    Object getCartInfo();

    /**
     * 改变购物车商品货品状态
     * @param checkedDTO
     * @return
     */
    Object changeChecked(CartCheckedDTO checkedDTO);
}
