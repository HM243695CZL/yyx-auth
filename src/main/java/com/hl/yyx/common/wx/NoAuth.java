package com.hl.yyx.common.wx;

import java.lang.annotation.*;

/**
 * 自定义注解   表示不需要登录就可以访问
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface NoAuth {
}
