package com.hl.yyx.modules.ums.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.modules.ums.dto.DictListDTO;
import com.hl.yyx.modules.ums.dto.DictPageDTO;
import com.hl.yyx.modules.ums.model.UmsDict;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-02
 */
public interface UmsDictService extends IService<UmsDict> {

    /**
     * 分页查询
     * @param pageDTO
     * @return
     */
    Page<UmsDict> pageList(DictPageDTO pageDTO);


    /**
     * 获取字典列表
     * @param listDTO
     * @return
     */
    List<UmsDict> dictList(DictListDTO listDTO);
}
