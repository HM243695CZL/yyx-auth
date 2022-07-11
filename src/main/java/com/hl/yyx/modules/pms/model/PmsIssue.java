package com.hl.yyx.modules.pms.model;

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
 * 常见问题表
 * </p>
 *
 * @author hl243695czyn
 * @since 2022-07-11
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("pms_issue")
@ApiModel(value="PmsIssue对象", description="常见问题表")
public class PmsIssue implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty(value = "问题标题")
    private String question;

    @ApiModelProperty(value = "问题答案")
    private String answer;

    @ApiModelProperty(value = "创建时间")
    private Date addTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    @ApiModelProperty(value = "逻辑删除")
    private Boolean deleted;


}
