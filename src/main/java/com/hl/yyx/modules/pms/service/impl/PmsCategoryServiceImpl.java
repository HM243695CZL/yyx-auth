package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.hl.yyx.common.vo.PageParamsDTO;
import com.hl.yyx.modules.pms.dto.FirstLvCateDTO;
import com.hl.yyx.modules.pms.model.PmsCategory;
import com.hl.yyx.modules.pms.mapper.PmsCategoryMapper;
import com.hl.yyx.modules.pms.service.PmsCategoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 类目表 服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-23
 */
@Service
public class PmsCategoryServiceImpl extends ServiceImpl<PmsCategoryMapper, PmsCategory> implements PmsCategoryService {


    /**
     * 获取所有的一级类目
     * @return
     */
    @Override
    public List<FirstLvCateDTO> getFirstLvList() {
        QueryWrapper<PmsCategory> wrapper = new QueryWrapper<>();
        wrapper.lambda().eq(PmsCategory::getLevel, "L1");
        List<PmsCategory> lvFirstList = list(wrapper);
        List<FirstLvCateDTO> list = new ArrayList<>();
        for (PmsCategory pmsCategory : lvFirstList) {
            FirstLvCateDTO firstLvCateDTO = new FirstLvCateDTO();
            firstLvCateDTO.setId(pmsCategory.getId());
            firstLvCateDTO.setName(pmsCategory.getName());
            list.add(firstLvCateDTO);
        }
        return list;
    }

    /**
     * 获取所有的类目【树形结构】
     * @return
     */
    @Override
    public List<PmsCategory> getList() {
        ArrayList<PmsCategory> dataList = new ArrayList<>();
        // 查询所有数据
        List<PmsCategory> list = list();
        // 找到一级类目
        for (PmsCategory pmsCategory : list) {
            if (pmsCategory.getLevel().equals("L1")) {
                pmsCategory.setChildren(new ArrayList<>());
                dataList.add(pmsCategory);
            }
        }
        // 根据父类目找到子类目
        for (PmsCategory pmsCategory : dataList) {
            pmsCategory.getChildren().add(findCateChildren(pmsCategory, dataList));
        }
        return dataList;
    }

    /**
     * 循环获取类目
     * @param pmsCategory 一级类目
     * @param list 所有类目
     * @return
     */
    private PmsCategory findCateChildren(PmsCategory pmsCategory, ArrayList<PmsCategory> list) {
        pmsCategory.setChildren(new ArrayList<>());
        for (PmsCategory category : list) {
            if (category.getId().equals(category.getPid())) {
                category.getChildren().add(findCateChildren(category, list));
            }
        }
        return pmsCategory;
    }
}