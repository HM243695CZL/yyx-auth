package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsGoodsProductService;
import com.hl.yyx.modules.pms.model.PmsGoodsProduct;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 商品货品表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
@RestController
@RequestMapping("/pms/pmsGoodsProduct")
public class PmsGoodsProductController {

    @Autowired
    private PmsGoodsProductService pmsGoodsProductService;

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsGoodsProduct pmsGoodsProduct) {
        return CommonResult.success(pmsGoodsProductService.save(pmsGoodsProduct));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsGoodsProduct pmsGoodsProduct) {
        return CommonResult.success(pmsGoodsProductService.updateById(pmsGoodsProduct));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsGoodsProductService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsGoodsProductService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsGoodsProductService.getById(id));
    }

}

