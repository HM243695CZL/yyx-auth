package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 角色表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_role")
@ApiModel(value = "UmsRole对象", description = "角色表")
public class UmsRole extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "角色名称")
    @TableField("`name`")
    @NotBlank(message = "角色名称不能为空")
    private String name;

    @ApiModelProperty(value = "角色key")
    @TableField("`key`")
    @NotBlank(message = "角色的key不能为空")
    private String key;

    @ApiModelProperty(value = "角色描述")
    @TableField("`desc`")
    private String desc;

    @ApiModelProperty(value = "是否启用")
    private Boolean enabled;

}
