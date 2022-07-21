package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.cms.dto.CollectionParamsDTO;
import com.hl.yyx.modules.cms.mapper.CmsCollectMapper;
import com.hl.yyx.modules.cms.model.CmsCollect;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsCollectService;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.hl.yyx.modules.pms.service.PmsGoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 收藏表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
@Service
@SuppressWarnings("all")
public class CmsCollectServiceImpl extends ServiceImpl<CmsCollectMapper, CmsCollect> implements CmsCollectService {

    @Autowired
    CmsUserService userService;

    @Autowired
    PmsGoodsService goodsService;

    @Autowired
    CmsCollectMapper collectMapper;

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<CmsCollect> pageList(CollectionParamsDTO paramsDTO) {
        Page<CmsCollect> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<CmsCollect> wrapper = new QueryWrapper<>();
        if (paramsDTO.getUserId() != null) {
            wrapper.lambda().like(CmsCollect::getUserId, paramsDTO.getUserId());
        }
        if (paramsDTO.getValueId() != null) {
            wrapper.lambda().like(CmsCollect::getValueId, paramsDTO.getValueId());
        }
        return page(page, wrapper);
    }

    /**
     * 收藏或更新收藏
     * @param goodsId
     * @return 0 取消收藏成功  1 添加收藏成功
     */
    @Override
    public String createOrDeleteCollection(Integer goodsId) {
        // 解密token获取id
        CmsUser userInfo = userService.getUserInfo(false);
        Integer userId = userInfo.getId();
        QueryWrapper<CmsCollect> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(CmsCollect::getUserId, userId);
        wrapper.lambda().eq(CmsCollect::getValueId, goodsId);
        CmsCollect collect = getOne(wrapper);
        if (collect != null) {
            // 取消收藏
            boolean remove = remove(wrapper);
            if (remove) {
                return "0";
            }
        } else {
            // 添加收藏
            CmsCollect co = new CmsCollect();
            co.setUserId(userId);
            co.setValueId(goodsId);
            co.setType(0);
            boolean save = save(co);
            if (save) {
                return "1";
            }
        }
        return "";
    }

    /**
     * 获取微信用户收藏列表
     * @return
     */
    @Override
    public Object getCollectionList() {
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<CmsCollect> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(CmsCollect::getUserId, userInfo.getId());
        // 按照添加时间排序
        wrapper.lambda().orderByDesc(CmsCollect::getUpdateTime);
        List<CmsCollect> collects = list(wrapper);
        List<Object> list = new ArrayList<>();
        for (CmsCollect collect : collects) {
            // 查询在售商品信息
            PmsGoods goods = goodsService.getById(collect.getValueId());
            if (goods.getIsOnSale()) {
                HashMap<String, Object> c = new HashMap<>();
                c.put("id", collect.getId());
                c.put("type", collect.getType());
                c.put("valueId", collect.getValueId());

                c.put("name", goods.getName());
                c.put("brief", goods.getBrief());
                c.put("picUrl", goods.getPicUrl());
                c.put("retailPrice", goods.getRetailPrice());
                list.add(c);
            }
        }
        return list;
    }

    /**
     * 删除收藏
     * @param ids
     * @return
     */
    @Override
    public Boolean deleteCollection(List<Integer> ids) {
        CmsUser userInfo = userService.getUserInfo(false);
        QueryWrapper<CmsCollect> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(CmsCollect::getUserId, userInfo.getId());
        int delete = collectMapper.delete(queryWrapper);
        return ids.size() == delete;
    }
}
