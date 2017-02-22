package lazyadmin.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import lazyadmin.entity.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Set;

/**
 * Created by Melon on 17/2/22.
 */
public interface AdminMapper extends BaseMapper<Admin> {

    void insertRoles(@Param(value = "adminId") Long adminId, @Param(value = "roleId") Long roleId);

    void deleteRoles(@Param(value = "adminId") Long adminId, @Param(value = "roleId") Long roleIds);

    Admin findByName(@Param(value = "username") String username);

    ArrayList<String> findRoles(@Param(value = "username") String username);

    ArrayList<String> findPermissions(@Param(value = "username") String username);
}
