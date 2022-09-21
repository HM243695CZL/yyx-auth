package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.cms.model.CmsFeedback;
import com.hl.yyx.modules.cms.service.CmsFeedbackService;
import com.hl.yyx.modules.cms.service.CmsUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 * 微信端-反馈
 */
@RestController
@RequestMapping("/wx/feedback")
@Api(tags = "微信端-反馈", description = "微信端-反馈")
public class WxFeedbackController {

    @Autowired
    CmsFeedbackService feedbackService;

    // 新增反馈
    @LogAnnotation()
    @ApiOperation("新增反馈")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody CmsFeedback feedback) {
        return CommonResult.success(feedbackService.create(feedback));
    }
}
