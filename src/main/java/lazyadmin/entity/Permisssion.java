package lazyadmin.entity;

import java.io.Serializable;

/**
 * Created by Melon on 17/2/22.
 */
public class Permisssion implements Serializable {

    private Long id;
    private String permission; //权限标识 程序中判断使用,如"user:create"
    private String description;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
