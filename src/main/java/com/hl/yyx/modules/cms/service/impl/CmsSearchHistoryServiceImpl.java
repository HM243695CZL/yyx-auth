package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.JWTUtils;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.model.CmsSearchHistory;
import com.hl.yyx.modules.cms.mapper.CmsSearchHistoryMapper;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsSearchHistoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.ums.service.UmsAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 搜索历史表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
@Service
@SuppressWarnings("all")
public class CmsSearchHistoryServiceImpl extends ServiceImpl<CmsSearchHistoryMapper, CmsSearchHistory> implements CmsSearchHistoryService {

    @Autowired
    CmsUserService userService;

    @Autowired
    UmsAdminService adminService;

    @Autowired
    CmsSearchHistoryMapper searchHistoryMapper;

    /**
     * 分页查询 - 查出已逻辑删除和未逻辑删除的数据
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<CmsSearchHistory> pageList(PageParamsDTO paramsDTO) {
        Page<CmsSearchHistory> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        Page<CmsSearchHistory> allData = searchHistoryMapper.getAllData(page);
        return allData;
    }

    /**
     * 微信端-获取用户搜索记录
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<CmsSearchHistory> getHistory(PageParamsDTO paramsDTO) {
        Page<CmsSearchHistory> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<CmsSearchHistory> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(CmsSearchHistory::getUserId, userInfo.getId());
        wrapper.lambda().orderByDesc(CmsSearchHistory::getUpdateTime);
        return page(page, wrapper);
    }

    /**
     * 清空搜索历史
     * @return
     */
    @Override
    public Boolean emptySearchHistory() {
        CmsUser userInfo = userService.getUserInfo(false);
        Integer userId = userInfo.getId();
        QueryWrapper<CmsSearchHistory> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(CmsSearchHistory::getUserId, userId);
        return remove(queryWrapper);
    }
}
