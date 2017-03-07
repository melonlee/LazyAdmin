package lazyadmin.service.impl;

import lazyadmin.entity.Admin;
import lazyadmin.service.AdminService;
import org.junit.Ignore;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.annotation.Resource;


/**
 * Created by Melon on 17/2/22.
 */


public class AdminServiceImplTest extends BaseTest {

    @Resource
    private AdminService adminService;

    public void testCorrelationRoles() throws Exception {
        adminService.correlationRoles(1L, 11L, 23L, 34L);
    }

    public void testCreateAdmin() throws Exception {

        Admin admin = new Admin();
        admin.setUsername("melon");
        admin.setPassword("1111");
        adminService.createAdmin(admin);
        logger.info(String.format("create admin [%s]", admin.toString()));

    }

    public void testChangePassword() throws Exception {

    }

    public void testUncorrelationRoles() throws Exception {

    }

    public void testFindByUsername() throws Exception {

        logger.info(String.format("the name is [%s]", adminService.findByUsername("melon")));
    }

    public void testFindRoles() throws Exception {

        logger.info(String.format("the role is [%s]", adminService.findRoles("melon")));
    }

    public void testFindPermissions() throws Exception {

    }
}