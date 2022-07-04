package com.hl.yyx.modules.pms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.GoodsDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsGoodsService;
import com.hl.yyx.modules.pms.model.PmsGoods;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 商品基本信息表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
@RestController
@Api(tags = "商品管理", description = "商品管理")
@RequestMapping("/admin/pms/goods")
public class PmsGoodsController {

    @Autowired
    private PmsGoodsService pmsGoodsService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page<PmsGoods> goodsList = pmsGoodsService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(goodsList));
    }

    // 新增
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody GoodsDTO goodsDTO) {
        return CommonResult.success(pmsGoodsService.create(goodsDTO));
    }

    // 更新
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsGoods pmsGoods) {
        return CommonResult.success(pmsGoodsService.updateById(pmsGoods));
    }

    // 删除
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsGoodsService.removeById(id));
    }

    // 获取全部
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsGoodsService.list());
    }

    // 查看
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsGoodsService.view(id));
    }

}

