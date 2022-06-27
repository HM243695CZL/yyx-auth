package com.hl.yyx.modules.pms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.GoodsAttrDTO;
import com.hl.yyx.common.vo.ParamsIdsDTO;
import com.hl.yyx.modules.pms.model.PmsGoodsAttribute;
import com.hl.yyx.modules.pms.service.PmsGoodsAttributeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 商品属性参数表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-27
 */
@RestController
@Api(tags = "商品属性管理", description = "商品属性管理")
@RequestMapping("/admin/pms/attr")
public class PmsGoodsAttributeController {

    @Autowired
    private PmsGoodsAttributeService pmsGoodsAttributeService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@Valid @RequestBody GoodsAttrDTO goodsAttrDTO) {
        Page<PmsGoodsAttribute> pageList = pmsGoodsAttributeService.pageList(goodsAttrDTO);
        return CommonResult.success(CommonPage.restPage(pageList));
    }

    // 新增
    @ApiOperation("新增商品属性")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody PmsGoodsAttribute pmsGoodsAttribute) {
        return CommonResult.success(pmsGoodsAttributeService.create(pmsGoodsAttribute));
    }

    // 更新
    @ApiOperation("更新商品属性")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody PmsGoodsAttribute pmsGoodsAttribute) {
        return CommonResult.success(pmsGoodsAttributeService.updateById(pmsGoodsAttribute));
    }

    // 删除
    @ApiOperation("删除商品属性")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public CommonResult delete(@RequestBody ParamsIdsDTO ids) {
        return CommonResult.success( pmsGoodsAttributeService.delete(ids));
    }

    // 获取全部
    @ApiOperation("获取全部商品属性")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(pmsGoodsAttributeService.list());
    }

    // 查看
    @ApiOperation("查看商品属性")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsGoodsAttributeService.getById(id));
    }

}

