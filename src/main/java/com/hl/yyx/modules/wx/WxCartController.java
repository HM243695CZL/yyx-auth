package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.pms.dto.CartCheckedDTO;
import com.hl.yyx.modules.pms.dto.CartDTO;
import com.hl.yyx.modules.pms.dto.ShoppingOrderDTO;
import com.hl.yyx.modules.pms.service.PmsCartService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 微信-购物车
 */
@RestController
@RequestMapping("/wx/cart")
@Api(tags = "微信端-购物车", description = "微信端-购物车")
public class WxCartController {

    @Autowired
    PmsCartService cartService;

    /**
     * 添加到购物车
     * @param cartDTO
     * @return
     */
    @ApiOperation("添加购物车")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult addCart(@RequestBody CartDTO cartDTO) {
        return CommonResult.success(cartService.create(cartDTO));
    }

    /**
     * 立即购买
     * @param cartDTO
     * @return
     */
    @ApiOperation("立即购买")
    @RequestMapping(value = "/fastAdd", method = RequestMethod.POST)
    public CommonResult fastAdd(@RequestBody CartDTO cartDTO) {
        return CommonResult.success(cartService.fastAdd(cartDTO));
    }

    /**
     * 获取购物车信息
     * @return
     */
    @ApiOperation("获取购物车信息")
    @RequestMapping(value = "/getCartInfo", method = RequestMethod.POST)
    public CommonResult getCartInfo() {
        return CommonResult.success(cartService.getCartInfo());
    }

    /**
     * 改变购物车商品货品状态
     */
    @ApiOperation("改变购物车商品货品状态")
    @RequestMapping(value = "/checked", method = RequestMethod.POST)
    public CommonResult changeChecked(@RequestBody CartCheckedDTO checkedDTO) {
        return CommonResult.success(cartService.changeChecked(checkedDTO));
    }

    /**
     * 删除购物车商品
     * @param ids
     * @return
     */
    @ApiOperation("删除购物车商品")
    @RequestMapping(value = "/emptyCart", method = RequestMethod.POST)
    public CommonResult emptyCart(@RequestBody List<Integer> ids) {
        return CommonResult.success(cartService.emptyCart(ids));
    }

    /**
     * 购物车下单
     * @return
     */
    @ApiOperation("购物车下单")
    @RequestMapping(value = "/shoppingOrder", method = RequestMethod.POST)
    public CommonResult shoppingOrder(@RequestBody List<Integer> cardIds) {
        return CommonResult.success(cartService.shoppingOrder(cardIds));
    }
}
