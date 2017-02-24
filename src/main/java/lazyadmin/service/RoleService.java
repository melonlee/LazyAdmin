package lazyadmin.service;

import lazyadmin.entity.Role;

import java.util.List;

/**
 * Created by Melon on 17/2/22.
 */
public interface RoleService {

    public Role createRole(Role role);

    public void deleteRole(Long roleId);

    /**
     * 设置角色-权限之间关系
     *
     * @param roleId
     * @param permissionIds
     */
    public void correlationPermissions(Long roleId, Long... permissionIds);

    /**
     * 解除角色-权限之间关系
     *
     * @param roleId
     * @param permissionIds
     */
    public void uncorrelationPermissions(Long roleId, Long... permissionIds);

    List<Role> findAll();

    void deletePermissionByRole(Long id);

    Role findOne(Long id);

    List<Role> findByAdmin(Long id);
}
