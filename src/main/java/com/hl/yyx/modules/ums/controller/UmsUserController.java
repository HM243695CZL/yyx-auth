package com.hl.yyx.modules.ums.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsUserService;
import com.hl.yyx.modules.ums.model.UmsUser;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-18
 */
@RestController
@Api(tags = "用户管理")
@RequestMapping("/admin/user")
public class UmsUserController {

    @Autowired
    private UmsUserService umsUserService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page page = umsUserService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(page));
    }

    // 新增
    @ApiOperation("新增用户")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody UmsUser umsUser) {
        return CommonResult.success(umsUserService.save(umsUser));
    }

    // 更新
    @ApiOperation("更新用户")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody UmsUser umsUser) {
        return CommonResult.success(umsUserService.updateById(umsUser));
    }

    // 删除
    @ApiOperation("删除用户")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( umsUserService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部用户")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(umsUserService.list());
    }

    // 查看
    @ApiOperation("查看用户")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(umsUserService.getById(id));
    }

}

