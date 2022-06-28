package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsGoodsAttributeService;
import com.hl.yyx.modules.pms.model.PmsGoodsAttribute;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 商品参数表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
@RestController
@RequestMapping("/pms/pmsGoodsAttribute")
public class PmsGoodsAttributeController {

    @Autowired
    private PmsGoodsAttributeService pmsGoodsAttributeService;

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsGoodsAttribute pmsGoodsAttribute) {
        return CommonResult.success(pmsGoodsAttributeService.save(pmsGoodsAttribute));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsGoodsAttribute pmsGoodsAttribute) {
        return CommonResult.success(pmsGoodsAttributeService.updateById(pmsGoodsAttribute));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsGoodsAttributeService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsGoodsAttributeService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsGoodsAttributeService.getById(id));
    }

}

