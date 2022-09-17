package com.hl.yyx.modules.pms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.pms.dto.OrderAfterSalePageDTO;
import com.hl.yyx.modules.pms.model.PmsAftersale;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 售后表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-11
 */
public interface PmsAftersaleMapper extends BaseMapper<PmsAftersale> {

    Page<PmsAftersale> pageList(Page<PmsAftersale> page, @Param("paramsDTO") OrderAfterSalePageDTO paramsDTO);
}
