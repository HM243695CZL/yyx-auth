package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.SearchDTO;
import com.hl.yyx.modules.pms.model.PmsKeyword;
import com.hl.yyx.modules.pms.mapper.PmsKeywordMapper;
import com.hl.yyx.modules.pms.service.PmsKeywordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 关键字表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
@Service
public class PmsKeywordServiceImpl extends ServiceImpl<PmsKeywordMapper, PmsKeyword> implements PmsKeywordService {

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsKeyword> pageList(PageParamsDTO paramsDTO) {
        Page<PmsKeyword> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<PmsKeyword> queryWrapper = new QueryWrapper<>();
        return page(page, queryWrapper);
    }

    /**
     * 获取搜索关键词提示
     * @return
     */
    @Override
    public Object getSearchHelper(SearchDTO searchDTO) {
        QueryWrapper<PmsKeyword> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(PmsKeyword::getKeyword, searchDTO.getKeyword());
        List<PmsKeyword> list = list(queryWrapper);
        String[] keys = new String[list.size()];
        int index = 0;
        for (PmsKeyword key : list) {
            keys[index++] = key.getKeyword();
        }
        return keys;
    }

    /**
     * 获取推荐关键词和热门关键词
     * @return
     */
    @Override
    public Object getRecommendAndHotKeyword() {
        QueryWrapper<PmsKeyword> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsKeyword::getIsDefault, 1);
        List<PmsKeyword> recommendList = list(queryWrapper);

        QueryWrapper<PmsKeyword> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsKeyword::getIsHot, 1);
        List<PmsKeyword> hotList = list(wrapper);

        HashMap<String, Object> map = new HashMap<>();
        map.put("recommendList", recommendList);
        map.put("hotList", hotList);
        return map;
    }
}
