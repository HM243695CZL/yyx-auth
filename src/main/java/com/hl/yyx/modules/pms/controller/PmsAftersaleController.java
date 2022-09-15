package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsAftersaleService;
import com.hl.yyx.modules.pms.model.PmsAftersale;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 售后表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-11
 */
@Api(tags = "售后管理", description = "售后管理")
@RestController
@RequestMapping("/pms/after-sale")
public class PmsAftersaleController {

    @Autowired
    private PmsAftersaleService pmsAftersaleService;

    // 删除
    @ApiOperation("删除售后")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsAftersaleService.removeById(id));
    }


}

