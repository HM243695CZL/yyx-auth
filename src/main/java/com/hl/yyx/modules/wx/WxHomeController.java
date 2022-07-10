package com.hl.yyx.modules.wx;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
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

/**
 * 微信小程序--首页服务
 */
@RestController
@RequestMapping("/wx/home")
@Api(tags = "获取首页数据", description = "微信首页数据")
public class WxHomeController {

    @Autowired
    private PmsGoodsService goodsService;

    /**
     * 分页获取首页数据
     * @param type 0 不排序 1 add_time降序 2 retail_price升序
     * @param pageIndex
     * @param pageSize
     * @return
     */
    @ApiOperation("分页获取首页数据")
    @NoWeiXinAuth
    @RequestMapping(value = "/getHomeGoods", method = RequestMethod.GET)
    public CommonResult getHomeGoods(@RequestParam Integer type,
                                     @RequestParam Integer pageIndex,
                                     @RequestParam Integer pageSize) {
        Page<PmsGoods> goodsList = goodsService.getHomeGoods(type, pageIndex, pageSize);
        return CommonResult.success(CommonPage.restPage(goodsList));
    }

}
