package com.hl.yyx.modules.ums.model;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hl.yyx.common.aop.TableDataUnique;
import com.hl.yyx.common.vo.BaseModelDTO;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 *
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-11-16
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("ums_form")
@ApiModel(value = "UmsForm对象", description = "")
public class UmsForm extends BaseModelDTO implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "表单名称")
    @NotBlank(message = "表单名称不能为空")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "表单key")
    @NotBlank(message = "表单key不能为空")
    @TableDataUnique(table = "ums_form", column = "form_key", message = "表单key已存在")
    private String formKey;

    @ApiModelProperty(value = "表单备注")
    private String remark;

    @ApiModelProperty(value = "表单配置")
    private String config;

}
