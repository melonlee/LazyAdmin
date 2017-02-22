package lazyadmin.service.impl;

import lazyadmin.entity.Role;
import lazyadmin.mapper.RoleMapper;
import lazyadmin.service.RoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by Melon on 17/2/22.
 */
@Service
public class RoleServiceImpl implements RoleService {

    @Resource
    private RoleMapper roleMapper;

    public Role createRole(Role role) {

        roleMapper.insert(role);

        return role;
    }

    public void deleteRole(Long roleId) {

        roleMapper.deleteById(roleId);
    }

    public void correlationPermissions(Long roleId, Long... permissionIds) {

        if (null == permissionIds || permissionIds.length == 0) {
            return;
        }

        for (Long permissionId : permissionIds) {
            roleMapper.insertPermissions(roleId, permissionId);
        }

    }

    public void uncorrelationPermissions(Long roleId, Long... permissionIds) {
        if (null == permissionIds || permissionIds.length == 0) {
            return;
        }
        for (Long permissionId : permissionIds) {
            roleMapper.deletePermissions(roleId, permissionId);
        }
    }
}
