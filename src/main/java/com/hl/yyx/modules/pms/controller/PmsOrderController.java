package com.hl.yyx.modules.pms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.OrderPageDTO;
import com.hl.yyx.modules.pms.dto.OrderParamsDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsOrderService;
import com.hl.yyx.modules.pms.model.PmsOrder;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 订单表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-05
 */
@RestController
@RequestMapping("/admin/pms/order")
@Api(tags = "订单管理", description = "订单管理")
public class PmsOrderController {

    @Autowired
    private PmsOrderService pmsOrderService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/list", method = RequestMethod.POST)
    public CommonResult page(@RequestBody OrderParamsDTO paramsDTO) {
        return CommonResult.success(pmsOrderService.list(paramsDTO));
    }

    // 删除
    @ApiOperation("删除订单")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsOrderService.removeById(id));
    }


    // 查看
    @ApiOperation("查看订单")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsOrderService.getById(id));
    }

}

