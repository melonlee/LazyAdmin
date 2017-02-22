package lazyadmin.service.impl;

import lazyadmin.entity.Admin;
import lazyadmin.mapper.AdminMapper;
import lazyadmin.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by Melon on 17/2/22.
 */

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    public Admin createAdmin(Admin admin) {
        adminMapper.insert(admin);
        return admin;
    }

    public void changePassword(Long adminId, String newPassword) {

        Admin admin = adminMapper.selectById(adminId);
        admin.setPassword(newPassword);
        adminMapper.updateById(admin);

    }

    public void correlationRoles(Long adminId, Long... roleIds) {

        if (null == roleIds && roleIds.length == 0) {
            return;
        }
        for (Long roleId : roleIds) {
            adminMapper.insertRoles(adminId, roleId);
        }
    }

    public void uncorrelationRoles(Long adminId, Long... roleIds) {
        if (null == roleIds && roleIds.length == 0) {
            return;
        }
        for (Long roleId : roleIds) {
            adminMapper.deleteRoles(adminId, roleId);
        }

    }

    public Admin findByUsername(String username) {
        return adminMapper.findByName(username);
    }

    public Set<String> findRoles(String username) {
        ArrayList<String> roles = adminMapper.findRoles(username);
        return new HashSet<String>(roles);
    }

    public Set<String> findPermissions(String username) {

        ArrayList<String> permissions = adminMapper.findPermissions(username);
        return new HashSet<String>(permissions);
    }

    private boolean check(Long roleId, Long permissionId) {
//        Integer count = adminMapper.findCountByRoleAndPermission(roleId,permissionId);
//        String sql = "select count(1) from t_roles_permissions where role_id=? and permission_id=?";
        return false;
    }

}
