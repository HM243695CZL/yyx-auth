package com.hl.yyx.common.wx;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

@Data
@ConfigurationProperties(prefix = "wxmini")
public class WxMaProperties {

    /**
     * 设置微信小程序的appid
     */
    private String appid;

    /**
     * 设置微信小程序的Secret
     */
    private String secret;

    /**
     * 消息格式，XML或者JSON
     */
    private String msgDataFormat;
}
