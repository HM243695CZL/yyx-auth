package com.hl.yyx.common.wx;

import cn.hutool.json.JSONUtil;
import com.alibaba.fastjson.JSON;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.api.RedisKey;
import com.hl.yyx.common.api.ResultCode;
import com.hl.yyx.common.util.JWTUtils;
import com.hl.yyx.modules.cms.model.CmsUser;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 微信拦截器   只拦截/wx开头的url
 */
@Component
public class LoginHandler implements HandlerInterceptor {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        /**
         * 通过自定义注解  @NoAuth 表示不需要登录
         * 通过token 获取用户信心
         * 将用户信息放入ThreadLocal当中
         */
        // 以 /admin开头的都放行
        if (request.getRequestURL().indexOf("/admin") > -1) {
            return true;
        }
        if (!(handler instanceof HandlerMethod)) {
            return true;
        }
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        if (handlerMethod.hasMethodAnnotation(NoAuth.class)) {
            return true;
        }
        String token = request.getHeader("Authorization");
        /**
         * 验证token是否有效
         * refresh为true， 刷新token并保存到redis
         * refresh为false，从redis中取用户信息返回
         */
        token = token.replace("Bearer ", "");
        boolean verify = JWTUtils.verify(token);
        if (!verify) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            // 响应未登录或已过期信息
            response.getWriter().println(JSONUtil.parse(CommonResult.failed(ResultCode.UNAUTHORIZED)));
            response.getWriter().flush();
            return false;
        }
        String userJson = redisTemplate.opsForValue().get(RedisKey.TOKEN_KEY + token);
        if (StringUtils.isBlank(userJson)) {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json");
            // 响应未登录或已过期信息
            response.getWriter().println(JSONUtil.parse(CommonResult.failed(ResultCode.UNAUTHORIZED)));
            response.getWriter().flush();
            return false;
        }
        CmsUser user = JSON.parseObject(userJson, CmsUser.class);
        UserThreadLocal.put(user);
        return true;
    }
}
