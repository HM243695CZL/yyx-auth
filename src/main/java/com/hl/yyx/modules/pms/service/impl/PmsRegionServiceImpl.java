package com.hl.yyx.modules.pms.service.impl;

import cn.hutool.core.util.StrUtil;
import com.hl.yyx.modules.pms.dto.RegionDTO;
import com.hl.yyx.modules.pms.model.PmsRegion;
import com.hl.yyx.modules.pms.mapper.PmsRegionMapper;
import com.hl.yyx.modules.pms.service.PmsRegionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-26
 */
@Service
public class PmsRegionServiceImpl extends ServiceImpl<PmsRegionMapper, PmsRegion> implements PmsRegionService {

    @Override
    public Object getList() {
        List<RegionDTO> regionVoList = new ArrayList<>();

        List<PmsRegion> list = list();
        Map<Integer, List<PmsRegion>> collect = list.stream().collect(Collectors.groupingBy(PmsRegion::getLevel));

        Integer provinceLevel = 0;
        List<PmsRegion> provinceList = collect.get(provinceLevel);

        Integer cityLevel = 1;
        List<PmsRegion> city = collect.get(cityLevel);
        Map<Integer, List<PmsRegion>> cityListMap = city.stream().collect(Collectors.groupingBy(PmsRegion::getPid));

        Integer areaLevel = 2;
        List<PmsRegion> areas = collect.get(areaLevel);
        Map<Integer, List<PmsRegion>> areaListMap = areas.stream().collect(Collectors.groupingBy(PmsRegion::getPid));
        for (PmsRegion province : provinceList) {
            RegionDTO regionDTO = new RegionDTO();
            regionDTO.setId(province.getId());
            regionDTO.setValue(province.getName());
            regionDTO.setCode(province.getCode());

            // 需要判断是否为空  因为中国台湾  中国香港  中国澳门在数据库中没有市   这三个单独添加到regionVoList
            List<PmsRegion> cityList = cityListMap.get(province.getId());
            if (cityList != null) {
                List<RegionDTO> cityVoList = new ArrayList<>();
                for (PmsRegion cityVo : cityList) {
                    RegionDTO cityVO = new RegionDTO();
                    cityVO.setId(cityVo.getId());
                    cityVO.setValue(cityVo.getName());
                    cityVO.setCode(cityVo.getCode());
                    List<PmsRegion> areaList = areaListMap.get(cityVo.getId());
                    // 需要判断是否为空   因为东莞市和中山市下没有设立区 如果不判断长度，则会报空指针
                    if (areaList != null) {
                        List<RegionDTO> areaVOList = new ArrayList<>();
                        for (PmsRegion area : areaList) {
                            RegionDTO areaVO = new RegionDTO();
                            areaVO.setId(area.getId());
                            areaVO.setValue(area.getName());
                            areaVO.setCode(area.getCode());
                            areaVOList.add(areaVO);
                        }
                        cityVO.setChildren(areaVOList);
                        cityVoList.add(cityVO);
                    }
                }
                regionDTO.setChildren(cityVoList);
            }
            // 单独添加 中国台湾  中国香港  中国澳门
            regionVoList.add(regionDTO);
        }
        return regionVoList;
    }
}
