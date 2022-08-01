package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.pms.dto.CartDTO;
import com.hl.yyx.modules.pms.service.PmsCartService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信-购物车
 */
@RestController
@RequestMapping("/wx/cart")
@Api(tags = "微信端-购物车", description = "微信端-购物车")
public class WxCartController {

    @Autowired
    PmsCartService cartService;

    @ApiOperation("添加购物车")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult addCart(@RequestBody CartDTO cartDTO) {
        return CommonResult.success(cartService.create(cartDTO));
    }
}
