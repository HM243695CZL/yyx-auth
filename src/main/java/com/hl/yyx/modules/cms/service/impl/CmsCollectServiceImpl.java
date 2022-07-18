package com.hl.yyx.modules.cms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.JWTUtils;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.cms.dto.CollectionParamsDTO;
import com.hl.yyx.modules.cms.model.CmsCollect;
import com.hl.yyx.modules.cms.mapper.CmsCollectMapper;
import com.hl.yyx.modules.cms.service.CmsCollectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 收藏表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
@Service
public class CmsCollectServiceImpl extends ServiceImpl<CmsCollectMapper, CmsCollect> implements CmsCollectService {

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
    public String createOrDeleteCollection(Integer goodsId, HttpServletRequest request) {
        // 解密token获取id
        String token = request.getHeader("Authorization");
        Long userId = JWTUtils.getUserId(token.replace("Bearer ", ""));
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
            co.setUserId(userId.intValue());
            co.setValueId(goodsId);
            co.setType(0);
            boolean save = save(co);
            if (save) {
                return "1";
            }
        }
        return "";
    }
}
