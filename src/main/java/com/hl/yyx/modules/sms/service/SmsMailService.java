package com.hl.yyx.modules.sms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.sms.model.SmsMail;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-25
 */
public interface SmsMailService extends IService<SmsMail> {

    /**
     * 发送简单文本邮件
     * @param subject 邮件主题
     * @param content 邮件内容
     */
    public void sendSimpleMail(String subject, String content);

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    Page<SmsMail> pageList(PageParamsDTO paramsDTO);
}
