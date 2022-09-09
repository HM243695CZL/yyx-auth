package com.hl.yyx.modules.pms.mapper;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.pms.dto.CommentPageDto;
import com.hl.yyx.modules.pms.model.PmsComment;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

/**
 * <p>
 * 评论表 Mapper 接口
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-09
 */
public interface PmsCommentMapper extends BaseMapper<PmsComment> {

    Page<PmsComment> pageList(Page<PmsComment> page, @Param("pageDto") CommentPageDto pageDto);
}
