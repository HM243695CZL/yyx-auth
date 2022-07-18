package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * 微信-商品
 */
@RestController
@RequestMapping("/wx/goods")
@Api(tags = "商品相关", description = "商品相关操作")
public class WxGoodsController {

    @Autowired
    private PmsGoodsService goodsService;

    /**
     * 获取商品详情
     * @param goodsId
     * @return
     */
    @NoWeiXinAuth
    @ApiOperation("获取商品详情")
    @RequestMapping(value = "/getGoodsInfo", method = RequestMethod.GET)
    public CommonResult getGoodsInfo(@RequestParam String goodsId, HttpServletRequest request) {
        HashMap<String, Object> goods = goodsService.wxDetail(goodsId, request);
        return CommonResult.success(goods);
    }
}
