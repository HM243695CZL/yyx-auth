package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.pms.dto.OrderRefundDTO;
import com.hl.yyx.modules.pms.dto.SubOrderDTO;
import com.hl.yyx.modules.pms.dto.WxOrderDTO;
import com.hl.yyx.modules.pms.model.PmsAftersale;
import com.hl.yyx.modules.pms.model.PmsComment;
import com.hl.yyx.modules.pms.service.PmsAftersaleService;
import com.hl.yyx.modules.pms.service.PmsCommentService;
import com.hl.yyx.modules.pms.service.PmsOrderGoodsService;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.text.ParseException;

/**
 * 微信端-订单
 */
@RestController
@RequestMapping("/wx/order")
@Api(tags = "微信端-订单", description = "微信端-订单")
public class WxOrderController {

    @Autowired
    PmsOrderService orderService;

    @Autowired
    PmsOrderGoodsService orderGoodsService;

    @Autowired
    PmsCommentService commentService;

    @Autowired
    PmsAftersaleService afterSaleService;

    /**
     * 提交订单
     * @param orderDTO
     * @return
     */
    @ApiOperation("提交订单")
    @RequestMapping(value = "/submitOrder", method = RequestMethod.POST)
    public CommonResult submitOrder(@Valid @RequestBody SubOrderDTO orderDTO) {
        return CommonResult.success(orderService.submitOrder(orderDTO));
    }

    /**
     * 获取订单详情
     * @param orderId
     * @return
     */
    @ApiOperation("获取订单详情")
    @RequestMapping(value = "/getOrderInfo", method = RequestMethod.GET)
    public CommonResult getOrderInfo(@RequestParam Integer orderId) throws ParseException {
        return CommonResult.success(orderService.getOrderInfo(orderId));
    }

    /**
     * 支付
     * @param orderId
     * @return
     */
    @ApiOperation("支付")
    @RequestMapping(value = "/pay", method = RequestMethod.GET)
    public CommonResult prePay(@RequestParam Integer orderId) {
        return CommonResult.success(orderService.prePay(orderId));
    }

    /**
     * 获取订单列表
     * @param paramsDTO
     * @return
     */
    @ApiOperation("获取订单列表")
    @RequestMapping(value = "/getOrderList", method = RequestMethod.POST)
    public CommonResult getOrderList(@RequestBody WxOrderDTO paramsDTO) {
        return CommonResult.success(orderService.getOrderList(paramsDTO));
    }

    /**
     * 取消订单
     * @param orderId
     * @return
     */
    @ApiOperation("取消订单")
    @RequestMapping(value = "/cancel", method = RequestMethod.GET)
    public CommonResult cancelOrder(@RequestParam Integer orderId) {
        return CommonResult.success(orderService.cancelOrder(orderId));
    }

    /**
     * 申请退款
     * @param refundDTO
     * @return
     */
    @ApiOperation("申请退款")
    @RequestMapping(value = "/applyRefund", method = RequestMethod.POST)
    public CommonResult applyRefund(@RequestBody OrderRefundDTO refundDTO) {
        return CommonResult.success(orderService.applyRefund(refundDTO));
    }

    /**
     * 确认收货
     * @param orderId
     * @return
     */
    @ApiOperation("确认收货")
    @RequestMapping(value = "/confirm", method = RequestMethod.GET)
    public CommonResult confirmOrder(@RequestParam Integer orderId) {
        return CommonResult.success(orderService.confirmOrder(orderId));
    }


    /**
     * 删除订单
     * @param orderId
     * @return
     */
    @ApiOperation("删除订单")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public CommonResult deleteOrder(@RequestParam Integer orderId) {
        return CommonResult.success(orderService.removeById(orderId));
    }

    /**
     * 获取待评价商品信息
     * @param orderGoodsId
     * @return
     */
    @ApiOperation("获取待评价商品信息")
    @RequestMapping(value = "/orderGoods", method = RequestMethod.GET)
    public CommonResult getOrderGoodsInfo(@RequestParam Integer orderGoodsId) {
        return CommonResult.success(orderGoodsService.getById(orderGoodsId));
    }

    /**
     * 评价订单商品
     * @param comment
     * @return
     */
    @ApiOperation("评价订单商品")
    @RequestMapping(value = "/comment", method = RequestMethod.POST)
    public CommonResult commentGoods(@RequestBody PmsComment comment) {
        return CommonResult.success(orderService.commentGoods(comment));
    }

    /**
     * 订单售后
     * @param aftersale
     * @return
     */
    @ApiOperation("订单售后")
    @RequestMapping(value = "/afterSale", method = RequestMethod.POST)
    public CommonResult orderAfterSale(@RequestBody PmsAftersale aftersale) {
        return CommonResult.success(afterSaleService.orderAfterSale(aftersale));
    }
}
