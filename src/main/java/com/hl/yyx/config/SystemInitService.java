package com.hl.yyx.config;

import com.hl.yyx.common.util.SystemInfoPrinter;
import com.hl.yyx.modules.ums.model.UmsSystem;
import com.hl.yyx.modules.ums.service.UmsSystemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * 系统启动服务，设置系统配置信息
 */
@Component
public class SystemInitService {

    private SystemInitService systemInitService;

    @Autowired
    private Environment environment;

    @Autowired
    private UmsSystemService systemService;

    @PostConstruct
    private void inist() {
        systemInitService = this;
        initConfigs();
        SystemInfoPrinter.printInfo("yyx 初始化信息", getSystemInfo());
    }

    private final static Map<String, String> DEFAULT_CONFIG = new HashMap<>();

    static {
        // 订单相关配置
        DEFAULT_CONFIG.put(SystemConfig.YYX_ORDER_UNPAID, "30");
        DEFAULT_CONFIG.put(SystemConfig.YYX_ORDER_UN_CONFIRM, "7");
        DEFAULT_CONFIG.put(SystemConfig.YYX_ORDER_COMMENT, "7");
        // 运费相关配置
        DEFAULT_CONFIG.put(SystemConfig.YYX_EXPRESS_FREIGHT_VALUE, "8"); // 运费金额
        DEFAULT_CONFIG.put(SystemConfig.YYX_EXPRESS_FREIGHT_MIN, "88"); // 满多少免运费
    }

    private void initConfigs() {
        // 获取数据库全部配置信息
        List<UmsSystem> list = systemService.list();
        HashMap<String, String> configs = new HashMap<>();
        for (UmsSystem item : list) {
            configs.put(item.getKeyName(), item.getKeyValue());
        }

        for (Map.Entry<String, String> entry : DEFAULT_CONFIG.entrySet()) {
            if (configs.containsKey(entry.getKey())){
                continue;
            }
            configs.put(entry.getKey(), entry.getValue());
            UmsSystem cfgSystem = new UmsSystem();
            cfgSystem.setKeyName(entry.getKey());
            cfgSystem.setKeyValue(entry.getValue());
            systemService.save(cfgSystem);
        }
        SystemConfig.setConfigs(configs);
    }

    private Map<String, String> getSystemInfo() {
        Map<String, String> infos = new LinkedHashMap<>();
        infos.put(SystemInfoPrinter.CREATE_PART_COPPER + 0, "系统信息");
        // 微信相关信息
        infos.put(SystemInfoPrinter.CREATE_PART_COPPER + 2, "微信相关");
        infos.put("微信APP KEY", environment.getProperty("wxmini.appid"));
        infos.put("微信APP SECRET", environment.getProperty("wxmini.secret"));
        return infos;
    }
}
