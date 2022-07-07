package com.hl.yyx.modules.cms.dto;


import lombok.Data;

/**
 * 微信登录的DTO
 */
@Data
public class WXAuthDTO {
    private String encryptedData;
    private String iv;
    private String sessionId;
}