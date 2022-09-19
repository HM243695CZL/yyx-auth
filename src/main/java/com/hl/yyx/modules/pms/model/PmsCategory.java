package com.hl.yyx.modules.pms.model;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hl.yyx.common.aop.TableDataUnique;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 类目表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-23
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_category")
@ApiModel(value="PmsCategory对象", description="类目表")
public class PmsCategory implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "类目名称")
    @TableField("`name`")
    @NotBlank(message = "类目名称不能为空")
    @TableDataUnique(table = "pms_category", column = "name", message = "类目名称已存在")
    private String name;

    @ApiModelProperty(value = "类目关键字，以JSON数组格式")
    private String keywords;

    @ApiModelProperty(value = "类目广告语介绍")
    @TableField("`desc`")
    private String desc;

    @ApiModelProperty(value = "父类目ID")
    private Integer pid;

    @ApiModelProperty(value = "类目图标")
    private String iconUrl;

    @ApiModelProperty(value = "类目图片")
    private String picUrl;

    private String level;

    @ApiModelProperty(value = "排序")
    private Integer sortOrder;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date addTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "逻辑删除")
    @TableLogic(value = "1", delval = "0")
    @JsonIgnore
    private Boolean deleted;

    @ApiModelProperty(value = "子级类目")
    @TableField(exist = false)
    private List<PmsCategory> children;


}
