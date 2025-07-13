package com.lazy.admin.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 权限实体类
 *
 * @author Melon
 * @version 2.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_permission")
@Schema(name = "Permission", description = "权限信息")
public class Permission implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "权限ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @Schema(description = "权限名称")
    @NotBlank(message = "权限名称不能为空")
    @Size(max = 50, message = "权限名称长度不能超过50")
    @TableField("permission_name")
    private String permissionName;

    @Schema(description = "权限编码")
    @NotBlank(message = "权限编码不能为空")
    @Size(max = 100, message = "权限编码长度不能超过100")
    @TableField("permission_code")
    private String permissionCode;

    @Schema(description = "权限类型 1:菜单 2:按钮")
    @TableField("type")
    private Integer type;

    @Schema(description = "父权限ID")
    @TableField("parent_id")
    private Long parentId;

    @Schema(description = "权限URL")
    @TableField("url")
    private String url;

    @Schema(description = "图标")
    @TableField("icon")
    private String icon;

    @Schema(description = "权限描述")
    @Size(max = 200, message = "权限描述长度不能超过200")
    @TableField("description")
    private String description;

    @Schema(description = "状态 0:禁用 1:启用")
    @TableField("status")
    private Integer status;

    @Schema(description = "排序")
    @TableField("sort")
    private Integer sort;

    @Schema(description = "是否删除 0:否 1:是")
    @TableLogic
    @TableField("deleted")
    private Integer deleted;

    @Schema(description = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "create_time", fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @Schema(description = "更新时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField(value = "update_time", fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    @Schema(description = "创建者")
    @TableField("create_by")
    private String createBy;

    @Schema(description = "更新者")
    @TableField("update_by")
    private String updateBy;

    @Schema(description = "子权限列表")
    @TableField(exist = false)
    private List<Permission> children;
} 