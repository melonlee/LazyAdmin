package lazyadmin.service;

import java.security.Permission;

/**
 * Created by Melon on 17/2/22.
 */
public interface PermissionService {

    public Permission createPermission(Permission permission);

    public void deletePermission(Long permissionId);
}
