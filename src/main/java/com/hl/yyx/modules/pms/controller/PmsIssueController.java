package com.hl.yyx.modules.pms.controller;

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

import com.hl.yyx.modules.pms.service.PmsIssueService;
import com.hl.yyx.modules.pms.model.PmsIssue;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 常见问题表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-11
 */
@RestController
@RequestMapping("/admin/pms/issue")
@Api(tags = "常见问题", description = "常见问题")
public class PmsIssueController {

    @Autowired
    private PmsIssueService pmsIssueService;

    // 分页查询
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page<PmsIssue> pageList = pmsIssueService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(pageList));
    }

    // 新增
    @ApiOperation("新增常见问题")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsIssue pmsIssue) {
        return CommonResult.success(pmsIssueService.save(pmsIssue));
    }

    // 更新
    @ApiOperation("更新常见问题")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsIssue pmsIssue) {
        return CommonResult.success(pmsIssueService.updateById(pmsIssue));
    }

    // 删除
    @ApiOperation("删除常见问题")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsIssueService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部常见问题")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsIssueService.list());
    }

    // 查看
    @ApiOperation("查看常见问题")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsIssueService.getById(id));
    }

}

