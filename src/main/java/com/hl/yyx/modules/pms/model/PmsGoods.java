package com.hl.yyx.modules.pms.model;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;

import com.baomidou.mybatisplus.extension.handlers.FastjsonTypeHandler;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 商品基本信息表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-06-28
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_goods")
@ApiModel(value="PmsGoods对象", description="商品基本信息表")
public class PmsGoods implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "商品编号")
    private String goodsSn;

    @ApiModelProperty(value = "商品名称")
    private String name;

    @ApiModelProperty(value = "商品所属类目ID")
    private Integer categoryId;

    private Integer brandId;

    @ApiModelProperty(value = "商品宣传图片列表，采用JSON数组格式")
    private String gallery;

    @ApiModelProperty(value = "商品关键字，采用逗号间隔")
    private String keywords;

    @ApiModelProperty(value = "商品简介")
    private String brief;

    @ApiModelProperty(value = "是否上架")
    private Boolean isOnSale;

    private Integer sortOrder;

    @ApiModelProperty(value = "商品页面商品图片")
    private String picUrl;

    @ApiModelProperty(value = "商品分享海报")
    private String shareUrl;

    @ApiModelProperty(value = "是否新品首发，如果设置则可以在新品首发页面展示")
    private Boolean isNew;

    @ApiModelProperty(value = "是否人气推荐，如果设置则可以在人气推荐页面展示")
    private Boolean isHot;

    @ApiModelProperty(value = "商品单位，例如件、盒")
    private String unit;

    @ApiModelProperty(value = "专柜价格")
    private BigDecimal counterPrice;

    @ApiModelProperty(value = "零售价格")
    private BigDecimal retailPrice;

    @ApiModelProperty(value = "商品详细介绍，是富文本格式")
    private String detail;

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
