package com.hl.yyx.modules.cms.controller;

import com.hl.yyx.common.api.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.cms.service.CmsFootprintService;
import com.hl.yyx.modules.cms.model.CmsFootprint;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 用户浏览足迹表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-18
 */
@RestController
@RequestMapping("/wx/cms/footprint")
public class CmsFootprintController {

    @Autowired
    private CmsFootprintService cmsFootprintService;

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( cmsFootprintService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(cmsFootprintService.list());
    }

}

