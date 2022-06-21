package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.hl.yyx.modules.ums.model.UmsMenu;

import java.util.List;

/**
 * <p>
 * 菜单表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-21
 */
public interface UmsMenuService extends IService<UmsMenu> {

    boolean create(UmsMenu umsMenu);

    List<UmsMenu> getMenuList();

    UmsMenu view(String id);

    boolean updateMenu(UmsMenu umsMenu);

    boolean delete(String id);
}
