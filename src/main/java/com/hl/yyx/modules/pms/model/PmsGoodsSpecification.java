package com.hl.yyx.modules.pms.model;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 商品规格表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_goods_specification")
@ApiModel(value="PmsGoodsSpecification对象", description="商品规格表")
public class PmsGoodsSpecification implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "商品表的商品ID")
    private Integer goodsId;

    @ApiModelProperty(value = "商品规格名称")
    private String specification;

    @ApiModelProperty(value = "商品规格值")
    private String value;

    @ApiModelProperty(value = "商品规格图片")
    private String picUrl;

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
    private Boolean deleted;


}
