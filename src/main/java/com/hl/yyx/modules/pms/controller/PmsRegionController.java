package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonResult;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsRegionService;
import com.hl.yyx.modules.pms.model.PmsRegion;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-26
 */
@RestController
@RequestMapping("/admin/pms/region")
@Api(tags = "行政区域", description = "行政区域")
public class PmsRegionController {

    @Autowired
    private PmsRegionService pmsRegionService;

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsRegionService.getList());
    }

}

