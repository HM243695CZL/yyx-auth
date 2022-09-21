package com.hl.yyx.modules.wx;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.pms.model.PmsIssue;
import com.hl.yyx.modules.pms.service.PmsIssueService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * 微信-常见问题
 */
@RestController
@RequestMapping("/wx/issue")
@Api(tags = "微信端-常见问题", description = "微信端-常见问题")
public class WxIssueController {

    @Autowired
    private PmsIssueService issueService;

    /**
     * 获取常见问题列表
     */
    @LogAnnotation()
    @NoWeiXinAuth
    @ApiOperation("获取常见问题列表")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult getCommonQuestion() {
        List<PmsIssue> list = issueService.list();
        return CommonResult.success(list);
    }
}
