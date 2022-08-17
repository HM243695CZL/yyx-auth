package com.hl.yyx.modules.pms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.pms.dto.OrderParamsDTO;
import com.hl.yyx.modules.pms.model.PmsOrder;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 订单表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-05
 */
public interface PmsOrderMapper extends BaseMapper<PmsOrder> {

    Page<PmsOrder> pageList(Page<PmsOrder> page, @Param("paramsDTO") OrderParamsDTO paramsDTO);
}
