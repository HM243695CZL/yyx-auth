package com.hl.yyx.modules.wx;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.vo.GoodsPageDTO;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.pms.model.PmsCategory;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.service.PmsCategoryService;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 微信-分类
 */
@RestController
@RequestMapping("/wx/category")
@Api(tags = "微信端-商品分类", description = "微信端-商品分类")
public class WxCategoryController {

    @Autowired
    private PmsCategoryService categoryService;

    @Autowired
    private PmsGoodsService goodsService;

    /**
     * 获取所有的二级分类
     */
    @LogAnnotation()
    @NoWeiXinAuth
    @ApiOperation("获取所有的二级分类")
    @RequestMapping(value = "/getSecondCategory", method = RequestMethod.GET)
    public CommonResult getSecondCategory() {
        List<PmsCategory> list = categoryService.getSecondCategory();
        return CommonResult.success(list);
    }

    /**
     * 根据分类获取商品
     * @return
     */
    @LogAnnotation()
    @NoWeiXinAuth
    @ApiOperation("根据分类获取商品")
    @RequestMapping(value = "/getGoodsByCategoryId", method = RequestMethod.POST)
    public CommonResult getGoodsByCategoryId(@RequestBody GoodsPageDTO pageDTO) {
        Page<PmsGoods> list = goodsService.pageList(pageDTO);
        return CommonResult.success(CommonPage.restPage(list));
    }
}
