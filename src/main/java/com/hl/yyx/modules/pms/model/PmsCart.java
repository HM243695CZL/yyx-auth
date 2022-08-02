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

/**
 * <p>
 * 购物车商品表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-01
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_cart")
@ApiModel(value="PmsCart对象", description="购物车商品表")
public class PmsCart implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户表的用户ID")
    private Integer userId;

    @ApiModelProperty(value = "商品表的商品ID")
    private Integer goodsId;

    @ApiModelProperty(value = "商品编号")
    private String goodsSn;

    @ApiModelProperty(value = "商品名称")
    private String goodsName;

    @ApiModelProperty(value = "商品货品表的货品ID")
    private Integer productId;

    @ApiModelProperty(value = "商品货品的价格")
    private BigDecimal price;

    @ApiModelProperty(value = "商品货品的数量")
    private Integer number;

    @ApiModelProperty(value = "商品规格值列表，采用JSON数组格式")
    private String specifications;

    @ApiModelProperty(value = "购物车中商品是否选择状态")
    private Boolean checked;

    @ApiModelProperty(value = "商品图片或者商品货品图片")
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
//    @TableLogic(value = "1", delval = "0")
    @JsonIgnore
    private Boolean deleted;


}
