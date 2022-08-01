package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsCartService;
import com.hl.yyx.modules.pms.model.PmsCart;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 购物车商品表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-01
 */
@RestController
@RequestMapping("/pms/pmsCart")
public class PmsCartController {

    @Autowired
    private PmsCartService pmsCartService;

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsCart pmsCart) {
        return CommonResult.success(pmsCartService.save(pmsCart));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsCart pmsCart) {
        return CommonResult.success(pmsCartService.updateById(pmsCart));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsCartService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsCartService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsCartService.getById(id));
    }

}

