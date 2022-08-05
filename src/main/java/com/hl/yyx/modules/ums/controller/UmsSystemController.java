package com.hl.yyx.modules.ums.controller;

import com.hl.yyx.common.api.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.ums.service.UmsSystemService;
import com.hl.yyx.modules.ums.model.UmsSystem;

import org.springframework.web.bind.annotation.RestController;

import java.util.Map;

/**
 * <p>
 * 系统配置表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-04
 */
@RestController
@RequestMapping("/admin/ums/system")
@Api(tags = "配置管理", description = "配置管理")
public class UmsSystemController {

    @Autowired
    private UmsSystemService umsSystemService;

    /**
     * 获取运费相关配置
     * @return
     */
    @ApiOperation("获取运费信息")
    @RequestMapping(value = "/getFreightInfo", method = RequestMethod.GET)
    public CommonResult getFreightInfo() {
        return CommonResult.success(umsSystemService.getFreightInfo());
    }

    /**
     * 获取订单配置信息
     * @return
     */
    @ApiOperation("获取订单配置信息")
    @RequestMapping(value = "/getOrderInfo", method = RequestMethod.GET)
    public CommonResult getOrderInfo() {
        return CommonResult.success(umsSystemService.getOrderInfo());
    }

    /**
     * 更新配置信息
     * @param config
     * @return
     */
    @ApiOperation("更新配置信息")
    @RequestMapping(value = "/updateConfig", method = RequestMethod.POST)
    public CommonResult updateConfig(@RequestBody Map<String, String> config) {
        return CommonResult.success(umsSystemService.updateConfig(config));
    }

}

