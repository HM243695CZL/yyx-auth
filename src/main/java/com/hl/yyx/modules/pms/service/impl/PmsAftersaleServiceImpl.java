package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.constants.AfterSaleConstants;
import com.hl.yyx.common.util.RandomUtil;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.dto.OrderAfterSalePageDTO;
import com.hl.yyx.modules.pms.mapper.PmsAftersaleMapper;
import com.hl.yyx.modules.pms.model.PmsAftersale;
import com.hl.yyx.modules.pms.model.PmsOrder;
import com.hl.yyx.modules.pms.model.PmsOrderGoods;
import com.hl.yyx.modules.pms.service.PmsAftersaleService;
import com.hl.yyx.modules.pms.service.PmsOrderGoodsService;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;

/**
 * <p>
 * 售后表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-11
 */
@Service
@SuppressWarnings("all")
public class PmsAftersaleServiceImpl extends ServiceImpl<PmsAftersaleMapper, PmsAftersale> implements PmsAftersaleService {

    @Autowired
    CmsUserService userService;

    @Autowired
    PmsOrderService orderService;

    @Autowired
    PmsOrderGoodsService orderGoodsService;

    @Autowired
    PmsAftersaleMapper afterSaleMapper;

    /**
     * 订单售后
     * @param aftersale
     * @return
     */
    @Override
    @Transactional
    public Boolean orderAfterSale(PmsAftersale aftersale) {
        // 删除旧的售后记录(如用户已取消，管理员拒绝)
        QueryWrapper<PmsAftersale> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsAftersale::getOrderId, aftersale.getOrderId());
        PmsAftersale afterSaleData = getOne(queryWrapper);
        if (afterSaleData != null) {
            removeById(afterSaleData.getId());
        }

        CmsUser userInfo = userService.getUserInfo(false);
        aftersale.setUserId(userInfo.getId());
        aftersale.setStatus(AfterSaleConstants.STATUS_REQUEST);
        aftersale.setAftersaleSn(RandomUtil.generateUniqueKey());
        boolean result = save(aftersale);

        // 更新订单售后状态
        orderService.setOrderAfterSaleStatus(aftersale.getOrderId(), AfterSaleConstants.STATUS_REQUEST);
        return result;
    }

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsAftersale> pageList(OrderAfterSalePageDTO paramsDTO) {
        Page<PmsAftersale> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        Page<PmsAftersale> afterSalePage = afterSaleMapper.pageList(page, paramsDTO);
        return afterSalePage;
    }

    /**
     * 根据订单id获取订单商品列表
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<PmsAftersale> getAfterSaleList(OrderAfterSalePageDTO paramsDTO) {
        Page<PmsAftersale> aftersalePage = pageList(paramsDTO);
        for (PmsAftersale record : aftersalePage.getRecords()) {
            QueryWrapper<PmsOrderGoods> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(PmsOrderGoods::getOrderId, record.getOrderId());
            List<PmsOrderGoods> list = orderGoodsService.list(queryWrapper);
            record.setOrderGoodsList(list);
        }
        return aftersalePage;
    }

    /**
     * 根据订单id获取售后详情
     * @param orderId
     * @return
     */
    @Override
    public Object getAfterSaleInfo(String orderId) {
        PmsOrder orderInfo = orderService.getById(orderId);

        QueryWrapper<PmsOrderGoods> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().eq(PmsOrderGoods::getOrderId, orderId);
        List<PmsOrderGoods> orderGoodsList = orderGoodsService.list(queryWrapper);

        QueryWrapper<PmsAftersale> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsAftersale::getOrderId, orderId);
        PmsAftersale aftersale = getOne(wrapper);

        HashMap<String, Object> map = new HashMap<>();
        map.put("orderInfo", orderInfo);
        map.put("orderGoodsList", orderGoodsList);
        map.put("aftersale", aftersale);
        return map;
    }
}
