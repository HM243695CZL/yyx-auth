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

import com.hl.yyx.modules.pms.service.PmsBrandService;
import com.hl.yyx.modules.pms.model.PmsBrand;

import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>
 * 品牌商表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-24
 */
@RestController
@RequestMapping("/admin/pms/brand")
@Api(tags = "品牌制造商", description = "品牌制造商")
public class PmsBrandController {

    @Autowired
    private PmsBrandService pmsBrandService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page<PmsBrand> brandList = pmsBrandService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(brandList));
    }

    // 新增
    @ApiOperation("新增品牌商")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@Valid @RequestBody PmsBrand pmsBrand) {
        return CommonResult.success(pmsBrandService.save(pmsBrand));
    }

    // 更新
    @ApiOperation("更新品牌商")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@Valid @RequestBody PmsBrand pmsBrand) {
        return CommonResult.success(pmsBrandService.updateById(pmsBrand));
    }

    // 删除
    @ApiOperation("删除品牌商")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsBrandService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部品牌商")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsBrandService.list());
    }

    // 查看
    @ApiOperation("查看品牌商")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsBrandService.getById(id));
    }

}

