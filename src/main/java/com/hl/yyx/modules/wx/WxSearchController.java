package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.GoodsPageDTO;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.cms.service.CmsSearchHistoryService;
import com.hl.yyx.modules.pms.dto.SearchDTO;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import com.hl.yyx.modules.pms.service.PmsKeywordService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * 微信-搜索
 */
@RestController
@RequestMapping("/wx/search")
@Api(tags = "微信端-搜索", description = "微信端-搜索")
public class WxSearchController {

    @Autowired
    PmsKeywordService keywordService;

    @Autowired
    PmsGoodsService goodsService;

    @Autowired
    CmsSearchHistoryService searchHistoryService;



    /**
     * 获取搜索关键词提示
     * @return
     */
    @ApiOperation("关键词提示")
    @RequestMapping(value = "/helper", method = RequestMethod.POST)
    @NoWeiXinAuth
    public CommonResult getSearchHelper(@RequestBody SearchDTO searchDTO) {
        return CommonResult.success(keywordService.getSearchHelper(searchDTO));
    }

    /**
     * 根据关键字搜索商品
     */
    @ApiOperation("根据关键词搜索商品")
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    @NoWeiXinAuth
    public CommonResult searchGoodsList(@RequestBody GoodsPageDTO searchDTO, HttpServletRequest request) {
        return CommonResult.success(CommonPage.restPage(goodsService.searchGoodsList(searchDTO, request)));
    }

    /**
     * 获取搜索历史记录
     */
    @ApiOperation("获取搜索历史记录")
    @RequestMapping(value = "/getHistory", method = RequestMethod.POST)
    public CommonResult getHistory(@RequestBody PageParamsDTO paramsDTO) {
        return CommonResult.success(CommonPage.restPage(searchHistoryService.getHistory(paramsDTO)));
    }
}
