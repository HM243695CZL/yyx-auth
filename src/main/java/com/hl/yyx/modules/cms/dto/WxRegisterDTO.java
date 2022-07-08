package com.hl.yyx.modules.cms.dto;

import lombok.Data;

/**
 * 账号注册的DTO
 */
@Data
public class WxRegisterDTO {

    private String code;
    private String mobile;
    private String username;
    private String password;
}
