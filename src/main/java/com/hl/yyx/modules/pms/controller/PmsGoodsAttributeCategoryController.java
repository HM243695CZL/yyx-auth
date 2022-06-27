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

import com.hl.yyx.modules.pms.service.PmsGoodsAttributeCategoryService;
import com.hl.yyx.modules.pms.model.PmsGoodsAttributeCategory;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 产品属性分类表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-27
 */
@RestController
@Api(tags = "商品属性分类管理", description = "商品属性分类管理")
@RequestMapping("/admin/pms/attr/cate")
public class PmsGoodsAttributeCategoryController {

    @Autowired
    private PmsGoodsAttributeCategoryService pmsGoodsAttributeCategoryService;

    // 分页查询
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page<PmsGoodsAttributeCategory> pageList = pmsGoodsAttributeCategoryService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(pageList));
    }

    // 新增
    @ApiOperation("新增属性分类")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsGoodsAttributeCategory pmsGoodsAttributeCategory) {
        return CommonResult.success(pmsGoodsAttributeCategoryService.save(pmsGoodsAttributeCategory));
    }

    // 更新
    @ApiOperation("更新属性分类")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsGoodsAttributeCategory pmsGoodsAttributeCategory) {
        return CommonResult.success(pmsGoodsAttributeCategoryService.updateById(pmsGoodsAttributeCategory));
    }

    // 删除
    @ApiOperation("删除属性分类")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsGoodsAttributeCategoryService.delete(id));
    }

    // 获取全部
    @ApiOperation("获取全部属性分类")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsGoodsAttributeCategoryService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsGoodsAttributeCategoryService.getById(id));
    }

}

