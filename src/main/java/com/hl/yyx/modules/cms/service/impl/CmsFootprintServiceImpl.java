package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.cms.dto.FootprintParamsDTO;
import com.hl.yyx.modules.cms.model.CmsFootprint;
import com.hl.yyx.modules.cms.mapper.CmsFootprintMapper;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsFootprintService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 用户浏览足迹表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-18
 */
@Service
@SuppressWarnings("all")
public class CmsFootprintServiceImpl extends ServiceImpl<CmsFootprintMapper, CmsFootprint> implements CmsFootprintService {

    @Autowired
    CmsUserService userService;

    @Autowired
    PmsGoodsService goodsService;

    @Autowired
    CmsFootprintMapper footprintMapper;

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<CmsFootprint> pageList(FootprintParamsDTO paramsDTO) {
        Page<CmsFootprint> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<CmsFootprint> wrapper = new QueryWrapper<>();
        if (paramsDTO.getUserId() != null) {
            wrapper.lambda().like(CmsFootprint::getUserId, paramsDTO.getUserId());
        }
        if (paramsDTO.getGoodsId() != null) {
            wrapper.lambda().like(CmsFootprint::getGoodsId, paramsDTO.getGoodsId());
        }
        return page(page, wrapper);
    }

    /**
     * 获取微信用户浏览足迹
     * @return
     */
    @Override
    public Object getFootprintList() {
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<CmsFootprint> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(CmsFootprint::getUserId, userInfo.getId());
        wrapper.lambda().orderByDesc(CmsFootprint::getUpdateTime);
        List<CmsFootprint> footprints = list(wrapper);
        List<Object> list = new ArrayList<>();
        for (CmsFootprint footprint : footprints) {
            // 查询在售商品信息
            PmsGoods goods = goodsService.getById(footprint.getGoodsId());
            if (goods.getIsOnSale()) {
                HashMap<String, Object> f = new HashMap<>();
                f.put("id", footprint.getId());
                f.put("valueId", footprint.getGoodsId());
                f.put("addTime", footprint.getAddTime());

                f.put("name", goods.getName());
                f.put("brief", goods.getBrief());
                f.put("picUrl", goods.getPicUrl());
                f.put("retailPrice", goods.getRetailPrice());
                list.add(f);
            }
        }
        return list;
    }

    /**
     * 删除浏览足迹
     * @param ids
     * @return
     */
    @Transactional
    @Override
    public boolean deleteFootprint(List<Integer> ids) {
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<CmsFootprint> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(CmsFootprint::getUserId, userInfo.getId());
        for (Integer id : ids) {
            queryWrapper.lambda().eq(CmsFootprint::getId, id);
            queryWrapper.or();
        }
        int delete = footprintMapper.delete(queryWrapper);
        return ids.size() == delete;
    }
}
