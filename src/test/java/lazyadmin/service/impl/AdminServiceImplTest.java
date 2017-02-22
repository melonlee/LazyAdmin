package lazyadmin.service.impl;

import lazyadmin.entity.Admin;
import lazyadmin.service.AdminService;
import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;


/**
 * Created by Melon on 17/2/22.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:/spring/spring-*.xml"})
public class AdminServiceImplTest {

    @Resource
    private AdminService adminService;

    public final Logger logger = LoggerFactory.getLogger(AdminServiceImplTest.class);


    @Ignore
    public void testCorrelationRoles() throws Exception {
        adminService.correlationRoles(1L, 11L, 23L, 34L);
    }

    @Ignore
    public void testCreateAdmin() throws Exception {

        Admin admin = new Admin();
        admin.setUsername("melon");
        admin.setPassword("1111");
        adminService.createAdmin(admin);
        logger.info(String.format("create admin [%s]", admin.toString()));

    }

    @Ignore
    public void testChangePassword() throws Exception {

    }

    @Ignore
    public void testUncorrelationRoles() throws Exception {

    }

    @Ignore
    public void testFindByUsername() throws Exception {

        logger.info(String.format("the name is [%s]", adminService.findByUsername("melon")));
    }

    @Test
    public void testFindRoles() throws Exception {

        logger.info(String.format("the role is [%s]", adminService.findRoles("melon")));
    }

    @Ignore
    public void testFindPermissions() throws Exception {

    }
}