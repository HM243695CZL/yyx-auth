package com.hl.yyx.modules.ums.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hl.yyx.config.SystemConfig;
import com.hl.yyx.modules.ums.model.UmsSystem;
import com.hl.yyx.modules.ums.mapper.UmsSystemMapper;
import com.hl.yyx.modules.ums.service.UmsSystemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import io.swagger.models.auth.In;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统配置表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-04
 */
@Service
public class UmsSystemServiceImpl extends ServiceImpl<UmsSystemMapper, UmsSystem> implements UmsSystemService {

    /**
     * 获取运费信息
     * @return
     */
    @Override
    public Object getFreightInfo() {
        return getKeyAndValue("yyx_express_");
    }

    /**
     * 获取订单配置信息
     * @return
     */
    @Override
    public Object getOrderInfo() {
        return getKeyAndValue("yyx_order_");
    }

    /**
     * 更新配置信息
     * @param config
     * @return
     */
    @Transactional
    @Override
    public Object updateConfig(Map<String, String> config) {
        for (Map.Entry<String, String> entry : config.entrySet()) {
            UmsSystem system = new UmsSystem();
            system.setKeyName(entry.getKey());
            system.setKeyValue(entry.getValue());
            QueryWrapper<UmsSystem> queryWrapper = new QueryWrapper<>();
            queryWrapper.lambda().eq(UmsSystem::getKeyName, entry.getKey());
            update(system, queryWrapper);
        }
        SystemConfig.updateConfigs(config);
        return true;
    }

    public Map<String, String> getKeyAndValue(String key) {
        QueryWrapper<UmsSystem> queryWrapper = new QueryWrapper<>();
        queryWrapper.lambda().like(UmsSystem::getKeyName, key);
        List<UmsSystem> list = list(queryWrapper);
        Map<String, String> result = new HashMap<>();
        for (UmsSystem item : list) {
            result.put(item.getKeyName(), item.getKeyValue());
        }
        return result;
    }
}
