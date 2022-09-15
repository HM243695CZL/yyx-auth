package com.hl.yyx.modules.pms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.common.constants.AfterSaleConstants;
import com.hl.yyx.common.util.RandomUtil;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.hl.yyx.modules.pms.mapper.PmsAftersaleMapper;
import com.hl.yyx.modules.pms.model.PmsAftersale;
import com.hl.yyx.modules.pms.service.PmsAftersaleService;
import com.hl.yyx.modules.pms.service.PmsOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 * 售后表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-11
 */
@Service
public class PmsAftersaleServiceImpl extends ServiceImpl<PmsAftersaleMapper, PmsAftersale> implements PmsAftersaleService {

    @Autowired
    CmsUserService userService;

    @Autowired
    PmsOrderService orderService;

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
}
