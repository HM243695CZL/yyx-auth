package com.hl.yyx.common.vo;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import javax.validation.constraints.NotEmpty;
import java.util.List;

@Data
public class ParamsIdsDTO {

    @ApiModelProperty(value = "id数组")
    @NotEmpty(message = "id数组不能为空")
    private List<Integer> ids;
}
