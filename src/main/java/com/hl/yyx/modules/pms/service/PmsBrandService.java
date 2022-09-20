package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.BrandPageDTO;
import com.hl.yyx.modules.pms.model.PmsBrand;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 品牌商表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-24
 */
public interface PmsBrandService extends IService<PmsBrand> {

    Page<PmsBrand> pageList(BrandPageDTO paramsDTO);
}
