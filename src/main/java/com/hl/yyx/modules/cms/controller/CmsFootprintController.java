package com.hl.yyx.modules.cms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.FootprintParamsDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@RequestMapping("/admin/cms/footprint")
@Api(tags = "会员足迹", description = "会员足迹")
public class CmsFootprintController {

    @Autowired
    private CmsFootprintService cmsFootprintService;

    // 分页查询
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody FootprintParamsDTO paramsDTO) {
       Page<CmsFootprint> footprintList = cmsFootprintService.pageList(paramsDTO);
       return CommonResult.success(CommonPage.restPage(footprintList));
    }


    // 获取全部
    @LogAnnotation()
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(cmsFootprintService.list());
    }

}

