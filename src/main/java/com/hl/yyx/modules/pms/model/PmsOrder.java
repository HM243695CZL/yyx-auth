package com.hl.yyx.modules.pms.model;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.*;

import java.util.Date;
import java.io.Serializable;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.validation.constraints.NotBlank;

/**
 * <p>
 * 订单表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-08-05
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_order")
@ApiModel(value="PmsOrder对象", description="订单表")
public class PmsOrder implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "用户表的用户ID")
    private Integer userId;

    @ApiModelProperty(value = "订单编号")
    private String orderSn;

    @ApiModelProperty(value = "订单状态")
    private Integer orderStatus;

    @ApiModelProperty(value = "售后状态，0是可申请，1是用户已申请，2是管理员审核通过，3是管理员退款成功，4是管理员审核拒绝，5是用户已取消")
    private Integer aftersaleStatus;

    @ApiModelProperty(value = "收货人名称")
    private String consignee;

    @ApiModelProperty(value = "收货人手机号")
    private String mobile;

    @ApiModelProperty(value = "收货具体地址")
    private String address;

    @ApiModelProperty(value = "用户订单留言")
    private String message;

    @ApiModelProperty(value = "商品总费用")
    private BigDecimal goodsPrice;

    @ApiModelProperty(value = "配送费用")
    private BigDecimal freightPrice;

    @ApiModelProperty(value = "优惠券减免")
    private BigDecimal couponPrice;

    @ApiModelProperty(value = "用户积分减免")
    private BigDecimal integralPrice;

    @ApiModelProperty(value = "团购优惠价减免")
    private BigDecimal grouponPrice;

    @ApiModelProperty(value = "订单费用， = goods_price + freight_price - coupon_price")
    private BigDecimal orderPrice;

    @ApiModelProperty(value = "实付费用， = order_price - integral_price")
    private BigDecimal actualPrice;

    @ApiModelProperty(value = "微信付款编号")
    private String payId;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "微信付款时间")
    private Date payTime;

    @ApiModelProperty(value = "发货编号")
    private String shipSn;

    @ApiModelProperty(value = "发货快递公司")
    private String shipChannel;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "发货开始时间")
    private Date shipTime;

    @ApiModelProperty(value = "实际退款金额，（有可能退款金额小于实际支付金额）")
    private BigDecimal refundAmount;

    @ApiModelProperty(value = "退款方式")
    private String refundType;

    @ApiModelProperty(value = "退款备注")
    private String refundContent;

    @ApiModelProperty(value = "申请退款原因")
    private String applyRefundReason;


    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "退款时间")
    private Date refundTime;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "用户确认收货时间")
    private Date confirmTime;

    @ApiModelProperty(value = "待评价订单商品数量")
    private Integer comments;

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
    @ApiModelProperty(value = "订单关闭时间")
    private Date endTime;

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

    @ApiModelProperty(value = "下单用户")
    @TableField(exist = false)
    private String userName;

    @ApiModelProperty(value = "用户头像")
    @TableField(exist = false)
    private String avatar;

    @ApiModelProperty(value = "订单商品信息")
    @TableField(exist = false)
    private List<PmsOrderGoods> orderGoodsList;


}
