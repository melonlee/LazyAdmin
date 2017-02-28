package lazyadmin.service;

import lazyadmin.entity.Admin;

import java.util.List;
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

    /**
     * 更改密码
     *
     * @param adminId
     * @param newPassword
     */
    public void changePassword(Long adminId, String newPassword);

    /**
     * 绑定用户和角色之间关系
     *
     * @param adminId
     * @param roleIds
     */
    public void correlationRoles(Long adminId, Long... roleIds);

    /**
     * 解除用户和角色之间关系
     *
     * @param adminId
     */
    public void uncorrelationRoles(Long adminId);

    /**
     * 根据用户名查找对应用户
     *
     * @param username
     * @return
     */
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

    /**
     * 列出所有用户
     *
     * @return
     */
    List<Admin> findAll();

    /**
     * 根据用户id查找用户
     *
     * @param id
     * @return
     */
    Admin findOne(Long id);

    /**
     * 根据id删除用户
     *
     * @param id
     */
    void delete(Long id);

    /**
     * 更新用户信息
     *
     * @param admin
     * @return
     */

    Admin updateAdmin(Admin admin);
}
