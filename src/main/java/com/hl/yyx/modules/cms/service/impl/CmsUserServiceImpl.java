package com.hl.yyx.modules.cms.service.impl;

import cn.hutool.http.HttpUtil;
import com.hl.yyx.common.api.RedisKey;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.mapper.CmsUserMapper;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * 用户表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-07
 */
@Service
public class CmsUserServiceImpl extends ServiceImpl<CmsUserMapper, CmsUser> implements CmsUserService {

    @Value("${wxmini.appid}")
    private String appId;
    @Value("${wxmini.secret}")
    private String secret;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public Object getSessionId(String code) {
        /**
         * 拼接一个url， 微信登录凭证校验接口
         * 发起一个http的调用，获取微信的返回结果
         * 存到redis
         * 生成一个sessionId，返回给前端，作为当前登录用户的标识
         */
        String url = "https://api.weixin.qq.com/sns/jscode2session?appid={0}&secret={1}&js_code={2}&grant_type=authorization_code";
        String replaceUrl = url.replace("{0}", appId).replace("{1}", secret).replace("{2}", code);
        String result = HttpUtil.get(replaceUrl);
        String uuid = UUID.randomUUID().toString();
        redisTemplate.opsForValue().set(RedisKey.WX_SESSION_ID + uuid, result, 30, TimeUnit.MINUTES);
        Map<String, String> map = new HashMap<>();
        map.put("sessionId", uuid);
        return map;
    }
}
