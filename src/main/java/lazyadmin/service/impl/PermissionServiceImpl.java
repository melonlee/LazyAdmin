package lazyadmin.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import lazyadmin.entity.Permission;
import lazyadmin.mapper.PermissionMapper;
import lazyadmin.service.PermissionService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

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

    public List<Permission> findAll() {
        return permissionMapper.selectList(new EntityWrapper<Permission>());
    }

    public List<Permission> findByRole( Long roleId) {
        return permissionMapper.findByRole(roleId);
    }
}
