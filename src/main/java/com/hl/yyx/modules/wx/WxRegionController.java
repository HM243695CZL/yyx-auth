package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.pms.service.PmsRegionService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信端-行政区域
 */
@RestController
@RequestMapping("/wx/region")
@Api(tags = "微信端-行政区域", description = "微信端-行政区域")
public class WxRegionController {

    @Autowired
    PmsRegionService regionService;

    /**
     * 获取行政区域列表
     */
    @LogAnnotation()
    @ApiOperation("获取行政区域列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult getRegionList() {
        return CommonResult.success(regionService.getList());
    }
}
