package lazyadmin.service;

import lazyadmin.entity.Admin;

import java.util.Set;

/**
 * Created by Melon on 17/2/22.
 */
public interface AdminService {


    /**
     * 新增管理员
     *
     * @param admin
     * @return
     */
    public Admin createAdmin(Admin admin);

    public void changePassword(Long adminId, String newPassword);

    public void correlationRoles(Long adminId, Long... roleIds);

    public void uncorrelationRoles(Long adminId, Long... roleIds);

    public Admin findByUsername(String username);

    /**
     * 根据用户名查找相应角色
     *
     * @param username
     * @return
     */
    public Set<String> findRoles(String username);

    /**
     * 根据用户名查找相应权限
     *
     * @param username
     * @return
     */
    public Set<String> findPermissions(String username);
}
