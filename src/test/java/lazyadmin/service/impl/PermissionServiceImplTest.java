package lazyadmin.service.impl;

import lazyadmin.mapper.PermissionMapper;
import org.junit.Test;

import javax.annotation.Resource;

import static org.junit.Assert.*;

/**
 * Created by Melon on 17/2/28.
 */
public class PermissionServiceImplTest extends BaseTest {

    @Resource
    private PermissionMapper permissionMapper;

    @Test
    public void testFindByRole() throws Exception {

        logger.info(String.format("Roles--> [%s]", permissionMapper.findByRole(1L).size()));


    }
}