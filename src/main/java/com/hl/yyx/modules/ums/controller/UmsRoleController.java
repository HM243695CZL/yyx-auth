package com.hl.yyx.modules.ums.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.hl.yyx.modules.ums.service.UmsRoleService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

/**
 * <p>
 * 角色表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-19
 */
@RestController
@Api(tags = "角色管理", description = "角色管理")
@RequestMapping("/admin/role")
public class UmsRoleController {

    @Autowired
    private UmsRoleService umsRoleService;

    // 分页
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody PageParamsDTO paramsDTO) {
        Page<UmsRole> roleList = umsRoleService.pageList(paramsDTO);
        return CommonResult.success(CommonPage.restPage(roleList));
    }

    // 新增
    @ApiOperation("新增角色")
    @RequestMapping(value = "/create", method = RequestMethod.POST)
    public CommonResult save(@Valid @RequestBody UmsRole umsRole) {
        boolean result = umsRoleService.save(umsRole);
        return CommonResult.success(result);
    }

    // 分配权限
    @ApiOperation("分配权限")
    @RequestMapping(value = "/auth", method = RequestMethod.POST)
    public CommonResult auth(@RequestBody List<Integer> menuIds, Integer id) {
        boolean result = umsRoleService.auth(menuIds, id);
        return CommonResult.success(result);
    }

    // 更新
    @ApiOperation("更新角色")
    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public CommonResult update(@RequestBody UmsRole umsRole) {
        return CommonResult.success(umsRoleService.updateById(umsRole));
    }

    // 删除
    @ApiOperation("删除角色")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( umsRoleService.delete(id));
    }

    // 获取全部
    @ApiOperation("获取全部角色")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public CommonResult list() {
        QueryWrapper<UmsRole> queryWrapper = new QueryWrapper<>();
        // 获取启用状态的角色
        queryWrapper.lambda().eq(UmsRole::getEnabled, true);
        return CommonResult.success(umsRoleService.list(queryWrapper));
    }

    // 查看
    @ApiOperation("查看角色")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(umsRoleService.getById(id));
    }

}

