package com.hl.yyx.modules.cms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.FeedbackPageDTO;
import com.hl.yyx.modules.cms.model.CmsFeedback;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 意见反馈表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-27
 */
public interface CmsFeedbackMapper extends BaseMapper<CmsFeedback> {

    Page<CmsFeedback> pageList(Page<CmsFeedback> page, @Param("paramsDTO") FeedbackPageDTO paramsDTO);
}
