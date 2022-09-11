package com.hl.yyx.modules.pms.model;

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
 * 评论表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-09-09
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_comment")
@ApiModel(value="PmsComment对象", description="评论表")
public class PmsComment implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "如果type=0，则是商品id；如果是type=1，则是专题id。")
    private Integer valueId;

    @ApiModelProperty(value = "评论类型，如果type=0，则是商品评论；如果是type=1，则是专题评论；")
    private Integer type;

    @ApiModelProperty(value = "评论内容")
    private String content;

    @ApiModelProperty(value = "管理员回复内容")
    private String adminContent;

    @ApiModelProperty(value = "用户表的用户ID")
    private Integer userId;

    @ApiModelProperty(value = "是否含有图片")
    private Boolean hasPicture;

    @ApiModelProperty(value = "图片地址列表，采用JSON数组格式")
    private String picUrls;

    @ApiModelProperty(value = "评分， 1-5")
    private Integer star;

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

    @ApiModelProperty(value = "用户名称")
    @TableField(exist = false)
    private String username;

    @ApiModelProperty(value = "商品名称")
    @TableField(exist = false)
    private String goodsName;

    @ApiModelProperty(value = "订单商品id")
    @TableField(exist = false)
    private Integer orderGoodsId;


}
