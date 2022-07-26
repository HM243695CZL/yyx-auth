package com.hl.yyx.modules.cms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.cms.model.CmsSearchHistory;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 * 搜索历史表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
public interface CmsSearchHistoryMapper extends BaseMapper<CmsSearchHistory> {

    /**
     * 查出已逻辑删除和未逻辑删除的数据
     * @param page
     * @param id
     * @return
     */
    @Select("select * from cms_search_history order by add_time desc")
    Page<CmsSearchHistory> getAllData(Page<CmsSearchHistory> page);
}
