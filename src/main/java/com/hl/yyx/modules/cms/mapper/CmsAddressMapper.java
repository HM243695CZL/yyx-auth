package com.hl.yyx.modules.cms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.cms.dto.AddressParamsDTO;
import com.hl.yyx.modules.cms.model.CmsAddress;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 收货地址表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-21
 */
public interface CmsAddressMapper extends BaseMapper<CmsAddress> {

    Page<CmsAddress> pageList(Page<CmsAddress> page, @Param("paramsDTO") AddressParamsDTO paramsDTO);
}
