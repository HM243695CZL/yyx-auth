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
 * 订单商品表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-06
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_order_goods")
@ApiModel(value="PmsOrderGoods对象", description="订单商品表")
public class PmsOrderGoods implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "订单表的订单ID")
    private Integer orderId;

    @ApiModelProperty(value = "商品表的商品ID")
    private Integer goodsId;

    @ApiModelProperty(value = "商品名称")
    private String goodsName;

    @ApiModelProperty(value = "商品编号")
    private String goodsSn;

    @ApiModelProperty(value = "商品货品表的货品ID")
    private Integer productId;

    @ApiModelProperty(value = "商品货品的购买数量")
    private Integer number;

    @ApiModelProperty(value = "商品货品的售价")
    private BigDecimal price;

    @ApiModelProperty(value = "商品货品的规格列表")
    private String specifications;

    @ApiModelProperty(value = "商品货品图片或者商品图片")
    private String picUrl;

    @ApiModelProperty(value = "订单商品评论，如果是-1，则超期不能评价；如果是0，则可以评价；如果其他值，则是comment表里面的评论ID。")
    private Integer comment;

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
