package com.hl.yyx.modules.pms.controller;

import com.hl.yyx.common.api.CommonPage;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.log.LogAnnotation;
import com.hl.yyx.modules.pms.dto.CommentPageDto;
import com.hl.yyx.modules.pms.dto.ReplyCommentDTO;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.*;

import com.hl.yyx.modules.pms.service.PmsCommentService;
import com.hl.yyx.modules.pms.model.PmsComment;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 * 评论表 前端控制器
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-09
 */
@RestController
@RequestMapping("/admin/pms/comment")
@Api(tags = "商品评论", description = "商品评论")
public class PmsCommentController {

    @Autowired
    private PmsCommentService pmsCommentService;

    // 分页
    @LogAnnotation()
    @ApiOperation("分页查询")
    @RequestMapping(value = "/page", method = RequestMethod.POST)
    public CommonResult page(@RequestBody CommentPageDto pageDto) {
        return CommonResult.success(CommonPage.restPage(pmsCommentService.pageList(pageDto)));
    }

    // 删除
    @LogAnnotation()
    @ApiOperation("删除评论")
    @RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
    public CommonResult delete(@PathVariable String id) {
        return CommonResult.success( pmsCommentService.removeById(id));
    }

    // 查看
    @LogAnnotation()
    @ApiOperation("查看评论")
    @RequestMapping(value = "/view/{id}", method = RequestMethod.GET)
    public CommonResult findOne(@PathVariable String id) {
        return CommonResult.success(pmsCommentService.getById(id));
    }

    /**
     * 回复评论
     * @param commentDTO
     * @return
     */
    @LogAnnotation()
    @ApiOperation("回复评论")
    @RequestMapping(value = "/reply", method = RequestMethod.POST)
    public CommonResult replyComment(@RequestBody ReplyCommentDTO commentDTO) {
        return CommonResult.success(pmsCommentService.replyComment(commentDTO));
    }

}

