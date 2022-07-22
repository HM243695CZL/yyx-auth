package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.hl.yyx.modules.cms.service.CmsAddressService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信-会员地址
 */
@RestController
@RequestMapping("/wx/address")
@Api(tags = "微信端-收货地址", description = "微信端-收货地址")
public class WxAddressController {

    @Autowired
    private CmsAddressService addressService;

    /**
     * 新增收货地址
     */
    @ApiOperation("新增收货地址")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult create(@RequestBody CmsAddress address) {
        return CommonResult.success(addressService.create(address));
    }

    /**
     * 获取收货地址列表
     */
    @ApiOperation("获取收货地址列表")
    @RequestMapping(value = "/getAddressList", method = RequestMethod.GET)
    public CommonResult getAddressList() {
        return CommonResult.success(addressService.getAddressList());
    }
}
