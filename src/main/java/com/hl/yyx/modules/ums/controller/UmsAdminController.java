package com.hl.yyx.modules.ums.controller;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.dto.InitMenuDTO;
import com.hl.yyx.modules.ums.dto.UmsAdminLoginParam;
import com.hl.yyx.modules.ums.model.UmsAdmin;
import com.hl.yyx.modules.ums.service.UmsAdminService;
import com.hl.yyx.modules.ums.service.UmsMenuService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 管理员表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-20
 */
@RestController
@RequestMapping("/admin/admin")
@Api(tags = "管理员管理", description = "管理员管理")
public class UmsAdminController {

    @Autowired
    private UmsAdminService umsAdminService;

    @Autowired
    private UmsMenuService menuService;

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    // 登录
    @ApiOperation("登录")
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public CommonResult login(@RequestBody UmsAdminLoginParam loginParam) {
        String token = umsAdminService.login(loginParam.getUsername(), loginParam.getPassword());
        // 根据当前用户获取对应的菜单
        Integer userId = umsAdminService.getCurrentAdmin().getId();
        UmsAdmin userInfo = umsAdminService.getCurrentAdmin();
        List<InitMenuDTO> menuList = menuService.getMenuListByUserId(userId);
        HashMap<String, Object> tokenMap = new HashMap<>();
        tokenMap.put("token", token);
        tokenMap.put("userInfo", userInfo);
        tokenMap.put("menuList", menuList);
        tokenMap.put("tokenHead", tokenHead);
        return CommonResult.success(tokenMap);
    }

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page<UmsAdmin> adminList = umsAdminService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(adminList));
    }

    // 新增
    @ApiOperation("新增管理员")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@Valid @RequestBody UmsAdmin umsAdmin) {
        return CommonResult.success(umsAdminService.create(umsAdmin));
    }

    // 更新
    @ApiOperation("更新管理员")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@Valid @RequestBody UmsAdmin umsAdmin) {
        return CommonResult.success(umsAdminService.updateAdmin(umsAdmin));
    }

    // 删除
    @ApiOperation("删除管理员")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( umsAdminService.delete(id));
    }

    // 获取全部
    @ApiOperation("获取全部管理员")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        return CommonResult.success(umsAdminService.list());
    }

    // 查看
    @ApiOperation("查看管理员")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(umsAdminService.view(id));
    }
}

