package com.hl.yyx.modules.cms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.modules.cms.dto.CollectionParamsDTO;
import com.hl.yyx.modules.cms.model.CmsCollect;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * <p>
 * 收藏表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
public interface CmsCollectService extends IService<CmsCollect> {

    Page<CmsCollect> pageList(CollectionParamsDTO paramsDTO);

    /**
     * 收藏或更新收藏
     * @param goodsId
     * @return
     */
    String createOrDeleteCollection(Integer goodsId);

    /**
     * 获取微信用户的收藏列表
     * @return
     */
    Object getCollectionList();

    Boolean deleteCollection(List<Integer> ids);
}
