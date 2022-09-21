package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.cms.service.CmsCollectService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 微信-收藏
 */
@RestController
@RequestMapping("/wx/collection")
@Api(tags = "微信端-收藏", description = "微信端-收藏")
public class WxCollectionController {

    @Autowired
    private CmsCollectService collectService;

    /**
     * 收藏或更新收藏
     * @param goodsId
     * @return
     */
    @LogAnnotation()
    @ApiOperation("收藏或更新收藏")
    @RequestMapping(value = "/status/{goodsId}", method = RequestMethod.GET)
    public CommonResult createOrDeleteCollection(@PathVariable Integer goodsId) {
        return CommonResult.success(collectService.createOrDeleteCollection(goodsId));
    }

    /**
     * 获取微信用户的收藏列表
     * @return
     */
    @LogAnnotation()
    @ApiOperation("获取微信用户收藏列表")
    @RequestMapping(value = "/getCollectionList", method = RequestMethod.GET)
    public CommonResult getCollectionList () {
        return CommonResult.success(collectService.getCollectionList());
    }

    /**
     * 删除收藏
     * @param ids
     * @return
     */
    @LogAnnotation()
    @ApiOperation("删除收藏")
    @RequestMapping(value = "/emptyCollection", method = RequestMethod.POST)
    public CommonResult deleteCollection(@RequestBody List<Integer> ids) {
        return CommonResult.success(collectService.deleteCollection(ids));
    }
}
