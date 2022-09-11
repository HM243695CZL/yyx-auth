package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.pms.dto.CommentPageDto;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.service.PmsCommentService;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;

/**
 * 微信-商品
 */
@RestController
@RequestMapping("/wx/goods")
@Api(tags = "微信端-商品相关", description = "微信端-商品相关操作")
public class WxGoodsController {

    @Autowired
    private PmsGoodsService goodsService;

    @Autowired
    private PmsCommentService commentService;

    /**
     * 获取商品详情
     * @param goodsId
     * @return
     */
    @NoWeiXinAuth
    @ApiOperation("获取商品详情")
    @RequestMapping(value = "/getGoodsInfo", method = RequestMethod.GET)
    public CommonResult getGoodsInfo(@RequestParam Integer goodsId, HttpServletRequest request) {
        HashMap<String, Object> goods = goodsService.wxDetail(goodsId, request);
        return CommonResult.success(goods);
    }

    /**
     * 获取商品评论
     * @param pageDto
     * @return
     */
    @NoWeiXinAuth
    @ApiOperation("获取商品评论")
    @RequestMapping(value = "/getGoodsComments", method = RequestMethod.POST)
    public CommonResult getGoodsComments(@RequestBody CommentPageDto pageDto) {
        return CommonResult.success(CommonPage.restPage(commentService.pageList(pageDto)));
    }

    /**
     * 获取商品评论数量
     * @param goodsId
     * @return
     */
    @NoWeiXinAuth
    @ApiOperation("获取商品评论数量")
    @RequestMapping(value = "/getCommentsCount", method = RequestMethod.GET)
    public CommonResult getCommentsCount(@RequestParam Integer goodsId) {
        return CommonResult.success(commentService.getCommentsCount(goodsId));
    }
}
