package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.util.StrUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.IssuePageDTO;
import com.hl.yyx.modules.pms.model.PmsIssue;
import com.hl.yyx.modules.pms.mapper.PmsIssueMapper;
import com.hl.yyx.modules.pms.service.PmsIssueService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 常见问题表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-11
 */
@Service
public class PmsIssueServiceImpl extends ServiceImpl<PmsIssueMapper, PmsIssue> implements PmsIssueService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsIssue> pageList(IssuePageDTO paramsDTO) {
        Page<PmsIssue> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsIssue> wrapper = new QueryWrapper<>();
        if (StrUtil.isNotEmpty(paramsDTO.getQuestion())) {
            wrapper.lambda().like(PmsIssue::getQuestion, paramsDTO.getQuestion());
        }
        return page(page, wrapper);
    }
}
