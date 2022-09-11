package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.pms.dto.CommentPageDto;
import com.hl.yyx.modules.pms.dto.ReplyCommentDTO;
import com.hl.yyx.modules.pms.model.PmsComment;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 * 评论表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-09
 */
public interface PmsCommentService extends IService<PmsComment> {

    Page<PmsComment> pageList(CommentPageDto pageDto);

    /**
     * 回复评论
     * @param commentDTO
     * @return
     */
    Boolean replyComment(ReplyCommentDTO commentDTO);

    /**
     * 获取商品评论数量
     * @param goodsId
     * @return
     */
    Object getCommentsCount(Integer goodsId);
}
