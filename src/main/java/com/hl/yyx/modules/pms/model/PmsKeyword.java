package com.hl.yyx.modules.pms.model;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.hl.yyx.common.aop.TableDataUnique;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 关键字表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-25
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_keyword")
@ApiModel(value="PmsKeyword对象", description="关键字表")
public class PmsKeyword implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "关键字")
    @NotBlank(message = "关键字不能为空")
    @TableDataUnique(table = "pms_keyword", column = "keyword", message = "关键字已存在")
    private String keyword;

    @ApiModelProperty(value = "关键字的跳转链接")
    private String url;

    @ApiModelProperty(value = "是否是热门关键字")
    private Boolean isHot;

    @ApiModelProperty(value = "是否是默认关键字")
    private Boolean isDefault;

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
//    @TableLogic(value = "1", delval = "0")
    @JsonIgnore
    private Boolean deleted;


}
