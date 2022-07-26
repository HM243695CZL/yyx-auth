package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.model.CmsSearchHistory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 搜索历史表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
public interface CmsSearchHistoryService extends IService<CmsSearchHistory> {


    Page<CmsSearchHistory> pageList(PageParamsDTO paramsDTO);

    /**
     * 微信端-获取用户搜索记录
     * @param paramsDTO
     * @return
     */
    Page<CmsSearchHistory> getHistory(PageParamsDTO paramsDTO);

    /**
     * 清空搜索历史
     * @return
     */
    Boolean emptySearchHistory();
}
