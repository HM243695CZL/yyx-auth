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
 * 售后表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_aftersale")
@ApiModel(value="PmsAftersale对象", description="售后表")
public class PmsAftersale implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "售后编号")
    private String aftersaleSn;

    @ApiModelProperty(value = "订单ID")
    private Integer orderId;

    @ApiModelProperty(value = "用户ID")
    private Integer userId;

    @ApiModelProperty(value = "售后类型，0是未收货退款，1是已收货（无需退货）退款，2用户退货退款")
    private Integer type;

    @ApiModelProperty(value = "退款原因")
    private String reason;

    @ApiModelProperty(value = "退款金额")
    private BigDecimal amount;

    @ApiModelProperty(value = "退款凭证图片链接数组")
    private String pictures;

    @ApiModelProperty(value = "退款说明")
    private String comment;

    @ApiModelProperty(value = "售后状态，0是可申请，1是用户已申请，2是管理员审核通过，3是管理员退款成功，4是管理员审核拒绝，5是用户已取消")
    private Integer status;

    @ApiModelProperty(value = "管理员操作时间")
    private Date handleTime;

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
