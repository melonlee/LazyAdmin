package lazyadmin.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import lazyadmin.entity.Admin;
import lazyadmin.mapper.AdminMapper;
import lazyadmin.plugin.PasswordHelper;
import lazyadmin.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Created by Melon on 17/2/22.
 */

@Service
public class AdminServiceImpl implements AdminService {

    @Resource
    private AdminMapper adminMapper;

    @Resource
    private PasswordHelper passwordHelper;

    public Admin createAdmin(Admin admin) {
        passwordHelper.encryptPassword(admin);
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

    public void uncorrelationRoles(Long adminId) {
        adminMapper.deleteRoles(adminId);
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

    public List<Admin> findAll() {
        return adminMapper.selectList(new EntityWrapper<Admin>());
    }

    public Admin findOne(Long id) {
        return adminMapper.selectById(id);
    }

    public void delete(Long id) {
        adminMapper.deleteById(id);
    }

    public Admin updateAdmin(Admin admin) {
        passwordHelper.encryptPassword(admin);
        adminMapper.updateById(admin);
        return admin;
    }


}
