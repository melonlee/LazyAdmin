package lazyadmin.service.impl;

import lazyadmin.mapper.PermissionMapper;
import lazyadmin.service.PermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.security.Permission;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class PermissionServiceImpl implements PermissionService {

    @Resource
    private PermissionMapper permissionMapper;

    public Permission createPermission(Permission permission) {
        permissionMapper.insert(permission);
        return permission;
    }

    public void deletePermission(Long permissionId) {
        permissionMapper.deleteById(permissionId);
    }
}
