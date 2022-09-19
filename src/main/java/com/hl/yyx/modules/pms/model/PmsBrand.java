package com.hl.yyx.modules.pms.model;

import java.math.BigDecimal;

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
 * 品牌商表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-24
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_brand")
@ApiModel(value="PmsBrand对象", description="品牌商表")
public class PmsBrand implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "品牌商名称")
    @TableField("`name`")
    @NotBlank(message = "品牌商名称不能为空")
    private String name;

    @ApiModelProperty(value = "品牌商简介")
    @TableField("`desc`")
    @NotBlank(message = "品牌商简介不能为空")
    private String desc;

    @ApiModelProperty(value = "品牌商页的品牌商图片")
    @NotBlank(message = "品牌商图片不能为空")
    private String picUrl;

    private Integer sortOrder;

    @ApiModelProperty(value = "品牌商的商品低价，仅用于页面展示")
    private BigDecimal floorPrice;

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


}
