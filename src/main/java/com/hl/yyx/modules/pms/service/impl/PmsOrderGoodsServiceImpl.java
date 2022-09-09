package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hl.yyx.modules.pms.model.PmsOrderGoods;
import com.hl.yyx.modules.pms.mapper.PmsOrderGoodsMapper;
import com.hl.yyx.modules.pms.service.PmsOrderGoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 订单商品表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-06
 */
@Service
public class PmsOrderGoodsServiceImpl extends ServiceImpl<PmsOrderGoodsMapper, PmsOrderGoods> implements PmsOrderGoodsService {

    /**
     * 获取待评价订单商品数量
     * @param orderId
     * @return
     */
    @Override
    public Integer getComments(Integer orderId) {
        QueryWrapper<PmsOrderGoods> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsOrderGoods::getOrderId, orderId);
        return count(queryWrapper);
    }
}
