package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.GoodsPageDTO;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.GoodsDTO;
import com.hl.yyx.modules.pms.model.PmsGoods;
import com.baomidou.mybatisplus.extension.service.IService;
import io.swagger.models.auth.In;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 商品基本信息表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
public interface PmsGoodsService extends IService<PmsGoods> {

    Page<PmsGoods> pageList(GoodsPageDTO paramsDTO);

    Boolean create(GoodsDTO goodsDTO);

    HashMap<String, Object> view(String id);

    Boolean update(GoodsDTO goodsDTO);

    /**
     * 获取微信首页数据
     * @param type
     * @param pageIndex
     * @param pageSize
     * @return
     */
    Page<PmsGoods> getHomeGoods(Integer type, Integer pageIndex, Integer pageSize);

    /**
     * 微信端：获取商品详情
     * @param goodsId
     * @return
     */
    HashMap<String, Object> wxDetail(String goodsId, HttpServletRequest request);
}
