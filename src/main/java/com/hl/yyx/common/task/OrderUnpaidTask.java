package com.hl.yyx.common.task;


import com.hl.yyx.common.util.BeanUtil;
import com.hl.yyx.common.util.OrderUtil;
import com.hl.yyx.config.SystemConfig;
import com.hl.yyx.modules.pms.model.PmsOrder;
import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.hl.yyx.modules.pms.service.PmsOrderGoodsService;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import lombok.extern.slf4j.Slf4j;

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
        log.info("系统开始处理延时任务【订单超时未付款】");

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

    }
}
