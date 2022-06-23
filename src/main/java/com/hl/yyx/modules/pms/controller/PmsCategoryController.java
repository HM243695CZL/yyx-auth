package com.hl.yyx.modules.pms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.FirstLvCateDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsCategoryService;
import com.hl.yyx.modules.pms.model.PmsCategory;

import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 * 类目表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-23
 */
@RestController
@RequestMapping("/admin/pms/category")
@Api(tags = "商品类目管理", description = "商品类目管理")
public class PmsCategoryController {

    @Autowired
    private PmsCategoryService pmsCategoryService;


    // 新增
    @ApiOperation("新增商品类目")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsCategory pmsCategory) {
        return CommonResult.success(pmsCategoryService.save(pmsCategory));
    }

    // 更新
    @ApiOperation("更新商品类目")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsCategory pmsCategory) {
        return CommonResult.success(pmsCategoryService.updateById(pmsCategory));
    }

    // 删除
    @ApiOperation("删除商品类目")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsCategoryService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部商品类目")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsCategoryService.getList());
    }

    // 查看
    @ApiOperation("查看商品类目")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsCategoryService.getById(id));
    }

    // 获取所有的一级类目
    @ApiOperation("获取所有的一级类目")
    @RequestMapping(value = "/getL1", method = RequestMethod.GET)
    public CommonResult getFirstLvList() {
        List<FirstLvCateDTO> list = pmsCategoryService.getFirstLvList();
        return CommonResult.success(list);
    }

}

