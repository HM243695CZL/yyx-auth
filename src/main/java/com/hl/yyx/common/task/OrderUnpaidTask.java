package com.hl.yyx.common.task;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hl.yyx.common.exception.Asserts;
import com.hl.yyx.common.util.BeanUtil;
import com.hl.yyx.common.util.OrderUtil;
import com.hl.yyx.config.SystemConfig;
import com.hl.yyx.modules.pms.model.PmsOrder;
import com.hl.yyx.modules.pms.model.PmsOrderGoods;
import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.hl.yyx.modules.pms.service.PmsOrderGoodsService;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;
import java.util.List;

@Slf4j
public class OrderUnpaidTask extends Task {
    private int orderId = -1;


    public OrderUnpaidTask(Integer orderId, long delayInMilliseconds) {
        super("OrderUnpaidTask-" + orderId, delayInMilliseconds);
        this.orderId = orderId;
    }

    public OrderUnpaidTask(Integer orderId) {
        super("OrderUnpaidTask-" + orderId, SystemConfig.getOrderUnpaid() * 60 * 1000);
        this.orderId = orderId;
    }

    @Override
    public void run() {
        log.info("系统开始处理延时任务【订单超时未付款】，订单id：" + this.orderId);

        PmsOrderService orderService = BeanUtil.getBean(PmsOrderService.class);
        PmsOrderGoodsService orderGoodsService = BeanUtil.getBean(PmsOrderGoodsService.class);
        PmsGoodsProductService productService = BeanUtil.getBean(PmsGoodsProductService.class);

        PmsOrder order = orderService.getById(this.orderId);
        if (order == null) {
            return;
        }
        if (!OrderUtil.isCreateStatus(order)) {
            return;
        }

        // 设置订单已取消状态
        order.setOrderStatus(OrderUtil.STATUS_AUTO_CANCEL);
        order.setEndTime(new Date());
        if (!orderService.updateById(order)) {
            throw new RuntimeException("更新数据已失效");
        }

        // 商品货品数量增加
        Integer orderId = order.getId();
        QueryWrapper<PmsOrderGoods> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsOrderGoods::getOrderId, orderId);
        List<PmsOrderGoods> orderGoodsList = orderGoodsService.list(queryWrapper);
        for (PmsOrderGoods orderGoods : orderGoodsList) {
            Integer productId = orderGoods.getProductId();
            Integer number = orderGoods.getNumber();
            if (productService.addStock(productId, number)) {
                System.out.println("productId: " + productId);
                System.out.println("number: " + number);
                throw new RuntimeException("商品货品库存增加失败");
            }
        }

        log.info("系统结束处理延时任务【订单超时未付款】，订单id：" + this.orderId);
    }
}
