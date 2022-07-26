package com.hl.yyx.modules.pms.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-26
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_region")
@ApiModel(value="PmsRegion对象", description="")
public class PmsRegion implements Serializable {

    private static final long serialVersionUID=1L;

    @ApiModelProperty(value = "区划信息id")
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "父级挂接id")
    private Integer pid;

    @ApiModelProperty(value = "区划编码")
    private String code;

    @ApiModelProperty(value = "区划名称")
    @TableField("`name`")
    private String name;

    @ApiModelProperty(value = "备注")
    private String remark;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "状态 0 正常 -2 删除 -1 停用")
    private Boolean status;

    @ApiModelProperty(value = "级次id 0:省/自治区/直辖市 1:市级 2:县级")
    private Integer level;


}
