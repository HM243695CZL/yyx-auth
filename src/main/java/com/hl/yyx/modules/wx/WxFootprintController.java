package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.cms.service.CmsFootprintService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信-浏览足迹
 */
@RestController
@RequestMapping("/wx/footprint")
@Api(tags = "微信端-浏览足迹", description = "微信端-浏览足迹")
public class WxFootprintController {

    @Autowired
    private CmsFootprintService footprintService;

    /**
     * 获取微信用户浏览足迹
     * @return
     */
    @ApiOperation("获取微信用户浏览足迹")
    @RequestMapping(value = "/getFootprintList", method = RequestMethod.GET)
    public CommonResult getFootPrintList () {
        return CommonResult.success(footprintService.getFootprintList());
    }
}
