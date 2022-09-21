package com.hl.yyx.modules.sms.dto;

import com.hl.yyx.common.vo.PageParamsDTO;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

/**
 * 邮件DTO
 */
@Data
public class MailPageDTO extends PageParamsDTO {

    @ApiModelProperty(value = "收件人")
    private String to;
}
