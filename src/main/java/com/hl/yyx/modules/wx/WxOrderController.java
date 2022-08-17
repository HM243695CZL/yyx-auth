package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.pms.dto.SubOrderDTO;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.bouncycastle.cert.ocsp.Req;
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
}
