package lazyadmin.entity;

import java.io.Serializable;

/**
 * Created by Melon on 17/2/22.
 */
public class AdminRole implements Serializable {

    private Long adminId;
    private Long roleId;

    public Long getAdminId() {
        return adminId;
    }

    public void setAdminId(Long adminId) {
        this.adminId = adminId;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }
}
