package com.hl.yyx.common.wx;

import com.hl.yyx.modules.cms.model.CmsUser;

public class UserThreadLocal {

    private static final ThreadLocal<CmsUser> LOCAL = new ThreadLocal<>();

    public static void put(CmsUser user) {
        LOCAL.set(user);
    }

    public static CmsUser get() {
        return LOCAL.get();
    }

    public static void remove() {
        LOCAL.remove();
    }

}
