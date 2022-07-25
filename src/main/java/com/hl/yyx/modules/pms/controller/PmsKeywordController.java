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

import com.hl.yyx.modules.pms.service.PmsKeywordService;
import com.hl.yyx.modules.pms.model.PmsKeyword;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 关键字表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
@RestController
@RequestMapping("/admin/pms/keyword")
@Api(tags = "关键字", description = "关键字")
public class PmsKeywordController {

    @Autowired
    private PmsKeywordService pmsKeywordService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page<PmsKeyword> keywordPage = pmsKeywordService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(keywordPage));
    }


    // 新增
    @ApiOperation("新增关键字")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsKeyword pmsKeyword) {
        return CommonResult.success(pmsKeywordService.save(pmsKeyword));
    }

    // 更新
    @ApiOperation("更新关键字")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsKeyword pmsKeyword) {
        return CommonResult.success(pmsKeywordService.updateById(pmsKeyword));
    }

    // 删除
    @ApiOperation("删除关键字")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsKeywordService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部关键字")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsKeywordService.list());
    }

    // 查看
    @ApiOperation("查看关键字")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsKeywordService.getById(id));
    }

}

