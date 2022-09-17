package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.pms.dto.OrderAfterSalePageDTO;
import com.hl.yyx.modules.pms.service.PmsAftersaleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 微信端-售后
 */
@RestController
@RequestMapping("/wx/afterSale")
@Api(tags = "微信端-售后", description = "微信端-售后")
public class WxAfterSaleController {

    @Autowired
    PmsAftersaleService afterSaleService;

    /**
     * 获取售后列表
     * @param paramsDTO
     * @return
     */
    @ApiOperation("获取售后列表")
    @RequestMapping(value = "/getAfterSaleList", method = RequestMethod.POST)
    public CommonResult getAfterSaleList(@RequestBody OrderAfterSalePageDTO paramsDTO) {
        return CommonResult.success(CommonPage.restPage(afterSaleService.getAfterSaleList(paramsDTO)));
    }


    /**
     * 根据订单id获取售后详情
     * @param orderId
     * @return
     */
    @ApiModelProperty("根据订单id获取售后详情")
    @RequestMapping(value = "/getAfterSaleInfo/{orderId}", method = RequestMethod.GET)
    public CommonResult getAfterSaleInfo(@PathVariable String orderId) {
        return CommonResult.success(afterSaleService.getAfterSaleInfo(orderId));
    }
}
