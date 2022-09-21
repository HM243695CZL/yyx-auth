package com.hl.yyx.modules.cms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.CollectionParamsDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.cms.service.CmsCollectService;
import com.hl.yyx.modules.cms.model.CmsCollect;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 收藏表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
@RestController
@RequestMapping("/admin/cms/collection")
@Api(tags = "会员收藏管理", description = "会员收藏管理")
public class CmsCollectController {

    @Autowired
    private CmsCollectService cmsCollectService;

    // 分页
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody CollectionParamsDTO paramsDTO) {
        Page<CmsCollect> collectionList = cmsCollectService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(collectionList));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部收藏")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(cmsCollectService.list());
    }

}

