package lazyadmin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import lazyadmin.entity.Role;
import org.apache.ibatis.annotations.Param;

/**
 * Created by Melon on 17/2/22.
 */
public interface RoleMapper extends BaseMapper<Role> {

    void deletePermissions(@Param(value = "roleId") Long roleId, @Param(value = "permissionId") Long permissionId);

    void insertPermissions(@Param(value = "roleId") Long roleId, @Param(value = "permissionId") Long permissionId);
}
