package com.hl.yyx.modules.pms.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.FirstLvCateDTO;
import com.hl.yyx.modules.pms.model.PmsCategory;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 类目表 服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-23
 */
public interface PmsCategoryService extends IService<PmsCategory> {

    /**
     * 获取一级商品类目
     * @return
     */
    List<FirstLvCateDTO> getFirstLvList();

    /**
     * 获取所有商品类目
     * @return
     */
    List<PmsCategory> getList();

    /**
     * 删除商品类目
     * @param id
     * @return
     */
    boolean delete(String id);
}
