package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.model.PmsKeyword;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 关键字表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
public interface PmsKeywordService extends IService<PmsKeyword> {

    Page<PmsKeyword> pageList(PageParamsDTO paramsDTO);
}
