package com.hl.yyx.modules.cms.service.impl;

import cn.binarywang.wx.miniapp.api.WxMaService;
import cn.binarywang.wx.miniapp.bean.WxMaJscode2SessionResult;
import cn.hutool.http.HttpUtil;
import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.hl.yyx.common.api.RedisKey;
import com.hl.yyx.common.exception.ApiException;
import com.hl.yyx.common.util.IpUtil;
import com.hl.yyx.common.util.JWTUtils;
import com.hl.yyx.common.wx.UserThreadLocal;
import com.hl.yyx.modules.cms.dto.WXAuthDTO;
import com.hl.yyx.modules.cms.dto.WxRegisterDTO;
import com.hl.yyx.modules.cms.dto.WxUserInfo;
import com.hl.yyx.modules.cms.model.CmsUser;
import com.hl.yyx.modules.cms.mapper.CmsUserMapper;
import com.hl.yyx.modules.cms.service.CmsUserService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.hl.yyx.modules.cms.service.WxService;
import me.chanjar.weixin.common.error.WxErrorException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
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

    @Autowired
    private WxService wxService;

    @Autowired
    private WxMaService wxMaService;

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

    /**
     * 微信登录
     * @param wxAuthDTO
     * @param request
     * @return
     */
    @Override
    public Object wxAuthLogin(WXAuthDTO wxAuthDTO, HttpServletRequest request) {
        /**
         * 对wxAuthDTO解密
         * 解密完成， 得到微信用户信息  包含openId， 性别， 昵称 等信息
         * openId是唯一的，去会员表中查询openId是否存在  存在则登录
         * 不存在  则注册
         * 使用jwt技术，生成token，并返回
         */
        try {
            String json = wxService.wxDecrypt(wxAuthDTO.getEncryptedData(), wxAuthDTO.getSessionId(), wxAuthDTO.getIv());
            WxUserInfo wxUserInfo = JSON.parseObject(json, WxUserInfo.class);
            String openId = wxUserInfo.getOpenId();

            QueryWrapper<CmsUser> wrapper = new QueryWrapper<>();
            wrapper.lambda().eq(CmsUser::getWeixinOpenid, openId);
            CmsUser user = getOne(wrapper);
            if (user == null) {
                // 注册
                CmsUser cmsUser = wxUserInfoToUser(wxUserInfo, request, wxAuthDTO.getSessionId());
                save(cmsUser);
                return login(cmsUser);
            } else {
                // 登录
                user.setLastLoginTime(new Date());
                user.setLastLoginIp(IpUtil.getIpAddr(request));
                user.setSessionKey(wxAuthDTO.getSessionId());
                return login(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 登录
     * @param user
     * @return
     */
    private HashMap<Object, Object> login(CmsUser user) {
        // token
        String token = JWTUtils.sign(user.getId());
        user.setPassword(null);
        user.setUsername(null);
        user.setWeixinOpenid(null);
        HashMap<Object, Object> result = new HashMap<>();
        result.put("token", token);
        // 将用户信息保存到redis中
        redisTemplate.opsForValue().set(RedisKey.TOKEN_KEY + token, JSON.toJSONString(user), 7, TimeUnit.DAYS);
        return result;
    }


    /**
     * 将wxUserInfo 转为CmsUser对象
     * @param wxUserInfo
     * @return
     */
    private CmsUser wxUserInfoToUser (WxUserInfo wxUserInfo, HttpServletRequest request, String sessionKey) {
        CmsUser cmsUser = new CmsUser();
        cmsUser.setUsername(wxUserInfo.getOpenId());
        cmsUser.setPassword(wxUserInfo.getOpenId());
        cmsUser.setWeixinOpenid(wxUserInfo.getOpenId());
        cmsUser.setAvatar(wxUserInfo.getAvatarUrl());
        cmsUser.setNickname(wxUserInfo.getNickName());
        cmsUser.setGender(wxUserInfo.getGender());
        cmsUser.setUserLevel(0);
        cmsUser.setStatus(0);
        cmsUser.setLastLoginTime(new Date());
        cmsUser.setLastLoginIp(IpUtil.getIpAddr(request));
        cmsUser.setSessionKey(sessionKey);
        return cmsUser;
    }

    /**
     * 获取微信用户信息
     * @param refresh
     * @return
     */
    public CmsUser getUserInfo(Boolean refresh) {
        CmsUser user = UserThreadLocal.get();
        if (refresh) {
            String token = JWTUtils.sign(user.getId());
            redisTemplate.opsForValue().set(RedisKey.TOKEN_KEY + token, JSON.toJSONString(user), 7, TimeUnit.DAYS);
        }
        return user;
    }

    /**
     * 账号注册
     * @param registerDTO
     * @return
     */
    @Override
    public HashMap<Object, Object> accountRegister(WxRegisterDTO registerDTO, HttpServletRequest request) {
        String openId = null;
        try {
            WxMaJscode2SessionResult sessionInfo = wxMaService.getUserService().getSessionInfo(registerDTO.getCode());
            openId = sessionInfo.getOpenid();
        } catch (WxErrorException e) {
            e.printStackTrace();
            throw new ApiException("openId获取失败");
        }
        QueryWrapper<CmsUser> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(CmsUser::getWeixinOpenid, openId);
        CmsUser user = getOne(wrapper);
        if (user != null) {
            throw new ApiException("openId已绑定账号");
        }
        CmsUser cmsUser = new CmsUser();
        cmsUser.setUsername(registerDTO.getUsername());
        cmsUser.setPassword(registerDTO.getPassword());
        cmsUser.setWeixinOpenid(openId);
        cmsUser.setAvatar("https://hl-mall-tiny.oss-cn-chengdu.aliyuncs.com/hlmall/images/20220620/lihezong.webp");
        cmsUser.setNickname(registerDTO.getUsername());
        cmsUser.setGender("0");
        cmsUser.setUserLevel(0);
        cmsUser.setStatus(0);
        cmsUser.setLastLoginTime(new Date());
        cmsUser.setLastLoginIp(IpUtil.getIpAddr(request));
        save(cmsUser);
        return login(cmsUser);
    }
}
