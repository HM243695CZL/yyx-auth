package com.hl.yyx.modules.cms.controller;

import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.modules.cms.dto.WXAuthDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.cms.model.CmsUser;

import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 用户表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-07
 */
@RestController
@RequestMapping("/wx/cms/user")
@Api(tags = "会员管理", description = "会员管理")
@Slf4j
public class CmsUserController {

    @Autowired
    private CmsUserService cmsUserService;

    // 新增
    @ApiOperation("新增会员(微信用户)")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@RequestBody CmsUser cmsUser) {
        return CommonResult.success(cmsUserService.save(cmsUser));
    }

    // 更新
    @ApiOperation("更新会员(微信用户)")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody CmsUser cmsUser) {
        return CommonResult.success(cmsUserService.updateById(cmsUser));
    }

    // 删除
    @ApiOperation("删除会员(微信用户)")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( cmsUserService.removeById(id));
    }

    // 获取全部
    @ApiOperation("获取全部会员(微信用户)")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(cmsUserService.list());
    }

    // 查看
    @ApiOperation("查看会员(微信用户)")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(cmsUserService.getById(id));
    }

    // 获取sessionID
    @ApiOperation("微信登录获取sessionId")
    @RequestMapping(value = "/getSessionId", method = RequestMethod.GET)
    public CommonResult getSessionId(String code) {
        return CommonResult.success(cmsUserService.getSessionId(code));
    }


    // 微信一键登录
    @RequestMapping(value = "/loginByWeixin", method = RequestMethod.POST)
    public CommonResult authLogin(@RequestBody WXAuthDTO wxAuthDTO, HttpServletRequest request) {
        Object result = cmsUserService.wxAuthLogin(wxAuthDTO, request);
        log.info("{}", result);
        return CommonResult.success(result);
    }

    /**
     * 获取用户信息
     * @param refresh
     * @return
     */
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.GET)
    public CommonResult getUserInfo(@Param("refresh") Boolean refresh, HttpServletRequest request) {
        CmsUser user = cmsUserService.getUserInfo(refresh, request);
        return CommonResult.success(user);
    }
}

