package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.cms.dto.SetDefaultAddDTO;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.hl.yyx.modules.cms.service.CmsAddressService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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

    /**
     * 删除地址
     */
    @ApiOperation("删除地址")
    @RequestMapping(value = "/emptyAddress", method = RequestMethod.POST)
    public CommonResult deleteAddress(@RequestBody List<Integer> ids) {
        return CommonResult.success(addressService.deleteAddress(ids));
    }

    /**
     * 获取地址详情或默认地址
     * @param id 地址id
     * @return
     */
    @ApiOperation("获取地址详情")
    @RequestMapping(value = "/getAddressInfo/{id}", method = RequestMethod.GET)
    public CommonResult getAddressInfo(@PathVariable Integer id) {
        return CommonResult.success(addressService.getAddressInfo(id));
    }

    /**
     * 设置默认地址
     * @return
     */
    @ApiOperation("设置默认地址")
    @RequestMapping(value = "/setDefaultAddress", method = RequestMethod.POST)
    public CommonResult setDefaultAddress(@RequestBody SetDefaultAddDTO defaultAddDTO) {
        return CommonResult.success(addressService.setDefaultAddress(defaultAddDTO));
    }
}
