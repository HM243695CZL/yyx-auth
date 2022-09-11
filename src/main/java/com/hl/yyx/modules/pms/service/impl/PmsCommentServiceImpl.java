package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.dto.CommentPageDto;
import com.hl.yyx.modules.pms.dto.ReplyCommentDTO;
import com.hl.yyx.modules.pms.model.PmsComment;
import com.hl.yyx.modules.pms.mapper.PmsCommentMapper;
import com.hl.yyx.modules.pms.service.PmsCommentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;

/**
 * <p>
 * 评论表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-09
 */
@Service
@SuppressWarnings("all")
public class PmsCommentServiceImpl extends ServiceImpl<PmsCommentMapper, PmsComment> implements PmsCommentService {

    @Autowired
    PmsCommentMapper commentMapper;

    /**
     * 分页查询
     * @param pageDto
     * @return
     */
    @Override
    public Page<PmsComment> pageList(CommentPageDto pageDto) {
        Page<PmsComment> page = new Page<>(pageDto.getPageIndex(), pageDto.getPageSize());
        Page<PmsComment> commentPage = commentMapper.pageList(page, pageDto);
        return commentPage;
    }

    /**
     * 回复评论
     * @param commentDTO
     * @return
     */
    @Override
    public Boolean replyComment(ReplyCommentDTO commentDTO) {
        PmsComment comment = getById(commentDTO.getId());
        comment.setAdminContent(commentDTO.getAdminContent());
        return updateById(comment);
    }

    /**
     * 获取商品评论数量
     * @param goodsId
     * @return
     */
    @Override
    public Object getCommentsCount(Integer goodsId) {
        QueryWrapper<PmsComment> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsComment::getValueId, goodsId);
        queryWrapper.lambda().eq(PmsComment::getType, 0);
        int allCount = count(queryWrapper);

        QueryWrapper<PmsComment> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsComment::getValueId, goodsId);
        wrapper.lambda().eq(PmsComment::getHasPicture, true);
        int hasPicCount = count(wrapper);

        HashMap<String, Integer> map = new HashMap<>();
        map.put("allCount", allCount);
        map.put("hasPicCount", hasPicCount);
        return map;
    }
}
