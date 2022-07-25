package com.hl.yyx.modules.cms.controller;

import com.hl.yyx.common.api.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.cms.service.CmsSearchHistoryService;
import com.hl.yyx.modules.cms.model.CmsSearchHistory;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 搜索历史表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
@RestController
@RequestMapping("/cms/cmsSearchHistory")
public class CmsSearchHistoryController {

    @Autowired
    private CmsSearchHistoryService cmsSearchHistoryService;

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody CmsSearchHistory cmsSearchHistory) {
        return CommonResult.success(cmsSearchHistoryService.save(cmsSearchHistory));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody CmsSearchHistory cmsSearchHistory) {
        return CommonResult.success(cmsSearchHistoryService.updateById(cmsSearchHistory));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( cmsSearchHistoryService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(cmsSearchHistoryService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(cmsSearchHistoryService.getById(id));
    }

}

