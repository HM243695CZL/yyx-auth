package com.hl.yyx.modules.sms.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.util.OrderUtil;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.sms.model.SmsMail;
import com.hl.yyx.modules.sms.mapper.SmsMailMapper;
import com.hl.yyx.modules.sms.service.SmsMailService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-25
 */
@Service
@Slf4j
public class SmsMailServiceImpl extends ServiceImpl<SmsMailMapper, SmsMail> implements SmsMailService {

    @Value("${spring.mail.username}")
    private String sendFrom;

    @Value("${yyx.mail.sendTo}")
    private String sendTo;

    @Autowired
    private JavaMailSender javaMailSender;


    /**
     * 发送简单文本邮件
     * @param subject 邮件主题
     * @param content 邮件内容
     */
    @Override
    public void sendSimpleMail(String subject, String content) {
        // 发送邮件
        SimpleMailMessage message = new SimpleMailMessage();
        message.setFrom(sendFrom);
        message.setTo(sendTo);
        message.setSubject(subject);
        message.setText(content);
        message.setSentDate(new Date());
        javaMailSender.send(message);
        log.info("发送邮件成功：{}->{}", sendFrom, sendTo);

        SmsMail mail = new SmsMail();
        mail.setFrom(sendFrom);
        mail.setTo(sendTo);
        mail.setSubject(subject);
        mail.setContent(content);
        save(mail);
    }

    /**
     * 分页查询
     * @param paramsDTO
     * @return
     */
    @Override
    public Page<SmsMail> pageList(PageParamsDTO paramsDTO) {
        Page<SmsMail> page = new Page<>(paramsDTO.getPageIndex(), paramsDTO.getPageSize());
        QueryWrapper<SmsMail> wrapper = new QueryWrapper<>();
        return page(page, wrapper);
    }
}
