package com.hl.yyx.modules.cms.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.common.wx.NoWeiXinAuth;
import com.hl.yyx.modules.cms.dto.UserPageDTO;
import com.hl.yyx.modules.cms.dto.WXAuthDTO;
import com.hl.yyx.modules.cms.dto.WxLoginDTO;
import com.hl.yyx.modules.cms.dto.WxRegisterDTO;
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
import java.util.HashMap;

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
@Api(tags = "微信端-会员管理", description = "微信端-会员管理")
@Slf4j
public class CmsUserController {

    @Autowired
    private CmsUserService cmsUserService;

    // 分页
    @LogAnnotation()
    @ApiOperation("分页查询")
    @NoWeiXinAuth
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody UserPageDTO paramsDTO) {
        Page<CmsUser> memberList = cmsUserService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(memberList));
    }

    // 更新
    @LogAnnotation()
    @ApiOperation("更新会员(微信用户)")
    @NoWeiXinAuth
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody CmsUser cmsUser) {
        return CommonResult.success(cmsUserService.updateById(cmsUser));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除会员(微信用户)")
    @NoWeiXinAuth
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( cmsUserService.removeById(id));
    }

    // 获取全部
    @LogAnnotation()
    @ApiOperation("获取全部会员(微信用户)")
    @NoWeiXinAuth
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(cmsUserService.list());
    }

    // 查看
    @LogAnnotation()
    @NoWeiXinAuth
    @ApiOperation("查看会员(微信用户)")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(cmsUserService.getById(id));
    }

    // 获取sessionID
    @LogAnnotation()
    @NoWeiXinAuth
    @ApiOperation("微信登录获取sessionId")
    @RequestMapping(value = "/getSessionId", method = RequestMethod.GET)
    public CommonResult getSessionId(String code) {
        return CommonResult.success(cmsUserService.getSessionId(code));
    }


    // 微信一键登录
    @LogAnnotation()
    @NoWeiXinAuth
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
    @LogAnnotation()
    @RequestMapping(value = "/getUserInfo", method = RequestMethod.GET)
    public CommonResult getUserInfo(@Param("refresh") Boolean refresh) {
        CmsUser user = cmsUserService.getUserInfo(refresh);
        return CommonResult.success(user);
    }

    /**
     * 账号注册
     * @param registerDTO
     * @param request
     * @return
     */
    @LogAnnotation()
    @NoWeiXinAuth
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public CommonResult accountRegister(@RequestBody WxRegisterDTO registerDTO, HttpServletRequest request) {
        HashMap<Object, Object> result = cmsUserService.accountRegister(registerDTO, request);
        return CommonResult.success(result);
    }

    /**
     * 账号登录
     * @param loginDTO
     * @param request
     * @return
     */
    @LogAnnotation()
    @NoWeiXinAuth
    @RequestMapping(value = "/accountLogin", method = RequestMethod.POST)
    public CommonResult accountLogin(@RequestBody WxLoginDTO loginDTO, HttpServletRequest request) {
        HashMap<Object, Object> result =  cmsUserService.accountLogin(loginDTO, request);
        return CommonResult.success(result);
    }
}

