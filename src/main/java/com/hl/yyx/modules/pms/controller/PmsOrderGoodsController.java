package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsOrderGoodsService;
import com.hl.yyx.modules.pms.model.PmsOrderGoods;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 订单商品表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-06
 */
@RestController
@RequestMapping("/pms/pmsOrderGoods")
public class PmsOrderGoodsController {

    @Autowired
    private PmsOrderGoodsService pmsOrderGoodsService;

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsOrderGoods pmsOrderGoods) {
        return CommonResult.success(pmsOrderGoodsService.save(pmsOrderGoods));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsOrderGoods pmsOrderGoods) {
        return CommonResult.success(pmsOrderGoodsService.updateById(pmsOrderGoods));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsOrderGoodsService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsOrderGoodsService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsOrderGoodsService.getById(id));
    }

}

