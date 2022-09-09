package com.hl.yyx.common.express;

import com.hl.yyx.common.express.config.ExpressProperties;
import lombok.Data;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import java.util.List;
import java.util.Map;

/**
 * 物流查询服务
 * 快递鸟即时查询API http://www.kdniao.com/api-track
 */
@Data
public class ExpressService {

    private final Log logger = LogFactory.getLog(ExpressService.class);

    // 请求URL
    private String ReqURL = "http://api.kdniao.com/Ebusiness/EbusinessOrderHandle.aspx";

    private ExpressProperties properties;
}
