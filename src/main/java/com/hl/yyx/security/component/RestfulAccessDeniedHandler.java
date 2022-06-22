package com.hl.yyx.security.component;

import cn.hutool.json.JSONUtil;
import com.hl.yyx.common.api.CommonResult;
import com.hl.yyx.common.api.ResultCode;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * 没有权限访问时的相应处理类
 */
public class RestfulAccessDeniedHandler implements AccessDeniedHandler {
    @Override
    public void handle(HttpServletRequest httpServletRequest, HttpServletResponse response, AccessDeniedException e) throws IOException, ServletException {
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        // 响应无权限信息
        response.getWriter().println(JSONUtil.parse(CommonResult.failed(ResultCode.FORBIDDEN)));
        response.getWriter().flush();
    }
}
