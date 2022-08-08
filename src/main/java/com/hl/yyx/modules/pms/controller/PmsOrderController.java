package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonResult;
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
@RequestMapping("/pms/pmsOrder")
public class PmsOrderController {

    @Autowired
    private PmsOrderService pmsOrderService;

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsOrder pmsOrder) {
        return CommonResult.success(pmsOrderService.save(pmsOrder));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsOrder pmsOrder) {
        return CommonResult.success(pmsOrderService.updateById(pmsOrder));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsOrderService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsOrderService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsOrderService.getById(id));
    }

}

