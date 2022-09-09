package com.hl.yyx.modules.sms.controller;

import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.sms.service.SmsMailService;
import com.hl.yyx.modules.sms.model.SmsMail;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-25
 */
@RestController
@RequestMapping("/admin/sms/mail")
@Api(tags = "邮件管理", description = "邮件管理")
public class SmsMailController {

    @Autowired
    private SmsMailService smsMailService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        return CommonResult.success(CommonPage.restPage(smsMailService.pageList(paramsDTO)));
    }


    // 查看
    @ApiOperation("查看邮件")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(smsMailService.getById(id));
    }

}

