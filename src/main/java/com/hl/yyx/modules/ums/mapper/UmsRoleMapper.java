package com.hl.yyx.modules.ums.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.ums.model.UmsRole;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 * 角色表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-19
 */
public interface UmsRoleMapper extends BaseMapper<UmsRole> {

    boolean create(UmsRole umsRole);

    List<UmsRole> page(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize);
}
