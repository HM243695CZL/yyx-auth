package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.pms.dto.SubOrderDTO;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

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
}
