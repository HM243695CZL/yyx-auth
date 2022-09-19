package com.hl.yyx.modules.ums.controller;

import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.ums.dto.DictListDTO;
import com.hl.yyx.modules.ums.dto.DictPageDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsDictService;
import com.hl.yyx.modules.ums.model.UmsDict;

import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-02
 */
@Api(tags = "字典管理", description = "字典管理")
@RestController
@RequestMapping("/admin/ums/dict")
public class UmsDictController {

    @Autowired
    private UmsDictService umsDictService;

    // 分页
    @ApiOperation("分页")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody DictPageDTO pageDTO) {
        return CommonResult.success(CommonPage.restPage(umsDictService.pageList(pageDTO)));
    }

    // 获取列表
    @ApiOperation("获取字典列表")
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public CommonResult list(@RequestBody DictListDTO listDTO) {
        return CommonResult.success(umsDictService.dictList(listDTO));
    }


    // 新增
    @ApiOperation("新增字典")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@Valid @RequestBody UmsDict umsDict) {
        return CommonResult.success(umsDictService.save(umsDict));
    }

    // 更新
    @ApiOperation("更新字典")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@Valid @RequestBody UmsDict umsDict) {
        return CommonResult.success(umsDictService.updateById(umsDict));
    }

    // 删除
    @ApiOperation("删除字典")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( umsDictService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部字典")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(umsDictService.list());
    }

    // 查看
    @ApiOperation("查看字典")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(umsDictService.getById(id));
    }

}

