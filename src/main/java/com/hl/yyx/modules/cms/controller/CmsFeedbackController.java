package com.hl.yyx.modules.cms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.FeedbackPageDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.cms.service.CmsFeedbackService;
import com.hl.yyx.modules.cms.model.CmsFeedback;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 意见反馈表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-27
 */
@RestController
@RequestMapping("/admin/cms/feedback")
@Api(tags = "意见反馈管理", description = "意见反馈管理")
public class CmsFeedbackController {

    @Autowired
    private CmsFeedbackService cmsFeedbackService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody FeedbackPageDTO paramsDTO) {
        Page<CmsFeedback> feedbackPage = cmsFeedbackService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(feedbackPage));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( cmsFeedbackService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(cmsFeedbackService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(cmsFeedbackService.getById(id));
    }

}

