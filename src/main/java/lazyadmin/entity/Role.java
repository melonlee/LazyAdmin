package lazyadmin.entity;

import java.io.Serializable;
import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public class Role implements Serializable {

    private Long id;
    private String role; //角色标识 程序中判断使用,如"admin"
    private String description;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
