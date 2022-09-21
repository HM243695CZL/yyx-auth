package com.hl.yyx.modules.cms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.SearchHistoryPageDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
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
@RequestMapping("/admin/cms/searchHistory")
@Api(tags = "搜索历史", description = "搜索历史")
public class CmsSearchHistoryController {

    @Autowired
    private CmsSearchHistoryService cmsSearchHistoryService;

    // 分页
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody SearchHistoryPageDTO paramsDTO) {
        Page<CmsSearchHistory> pageList = cmsSearchHistoryService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(pageList));
    }

}

