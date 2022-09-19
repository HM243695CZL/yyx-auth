package com.hl.yyx.modules.cms.model;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 收藏表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-15
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("cms_collect")
@ApiModel(value="CmsCollect对象", description="收藏表")
public class CmsCollect implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户表的用户ID")
    private Integer userId;

    @ApiModelProperty(value = "如果type=0，则是商品ID；如果type=1，则是专题ID")
    @NotBlank(message = "商品id不能为空")
    private Integer valueId;

    @ApiModelProperty(value = "收藏类型，如果type=0，则是商品ID；如果type=1，则是专题ID")
    @NotBlank(message = "类型不能为空")
    private Integer type;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private Date addTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "更新时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private Date updateTime;

    @ApiModelProperty(value = "逻辑删除")
//    @TableLogic(value = "1", delval = "0")
    @JsonIgnore
    private Boolean deleted;


}
