package com.hl.yyx.modules.cms.controller;

import com.hl.yyx.common.api.CommonResult;
import io.swagger.annotations.Api;
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
@RequestMapping("/cms/cmsFeedback")
@Api(tags = "意见反馈管理", description = "意见反馈管理")
public class CmsFeedbackController {

    @Autowired
    private CmsFeedbackService cmsFeedbackService;

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody CmsFeedback cmsFeedback) {
        return CommonResult.success(cmsFeedbackService.save(cmsFeedback));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody CmsFeedback cmsFeedback) {
        return CommonResult.success(cmsFeedbackService.updateById(cmsFeedback));
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

