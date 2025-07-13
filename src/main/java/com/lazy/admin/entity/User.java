package com.lazy.admin.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 用户实体类
 *
 * @author Melon
 * @version 2.0.0
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("t_user")
@Schema(name = "User", description = "用户信息")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    @Schema(description = "用户ID")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @Schema(description = "用户名")
    @NotBlank(message = "用户名不能为空")
    @Size(min = 3, max = 50, message = "用户名长度必须在3-50之间")
    @TableField("username")
    private String username;

    @Schema(description = "密码")
    @JsonIgnore
    @NotBlank(message = "密码不能为空")
    @Size(min = 6, max = 100, message = "密码长度必须在6-100之间")
    @TableField("password")
    private String password;

    @Schema(description = "密码盐值")
    @JsonIgnore
    @TableField("salt")
    private String salt;

    @Schema(description = "邮箱")
    @Email(message = "邮箱格式不正确")
    @TableField("email")
    private String email;

    @Schema(description = "手机号")
    @TableField("phone")
    private String phone;

    @Schema(description = "真实姓名")
    @TableField("real_name")
    private String realName;

    @Schema(description = "头像")
    @TableField("avatar")
    private String avatar;

    @Schema(description = "状态 0:禁用 1:启用")
    @TableField("status")
    private Integer status;

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

    @Schema(description = "最后登录时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("last_login_time")
    private LocalDateTime lastLoginTime;

    @Schema(description = "用户角色列表")
    @TableField(exist = false)
    private List<Role> roles;

    @Schema(description = "用户权限列表")
    @TableField(exist = false)
    private List<String> permissions;

    /**
     * 获取密码凭证盐值
     */
    public String getCredentialsSalt() {
        return this.username + this.salt;
    }
} 