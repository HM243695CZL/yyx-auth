package com.hl.yyx.modules.cms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.AddressParamsDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.cms.service.CmsAddressService;
import com.hl.yyx.modules.cms.model.CmsAddress;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 收货地址表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-21
 */
@RestController
@RequestMapping("/admin/cms/address")
@Api(tags = "会员收货地址管理", description = "会员收货地址管理")
public class CmsAddressController {

    @Autowired
    private CmsAddressService cmsAddressService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody AddressParamsDTO paramsDTO) {
        Page<CmsAddress> addressList = cmsAddressService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(addressList));
    }

}

