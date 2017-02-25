package lazyadmin.web.controller;


import lazyadmin.entity.Role;
import lazyadmin.service.PermissionService;
import lazyadmin.service.RoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("/role")
public class RoleController {

    public static final Logger logger = LoggerFactory.getLogger(RoleController.class);

    @Resource
    private RoleService roleService;

    @Resource
    private PermissionService permissionService;


    @RequiresPermissions("role:view")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap map) {

        List<Role> roles = roleService.findAll();
        map.addAttribute("roles", roles);
        return "/role/index.ftl";
    }

    @RequiresPermissions("role:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
        modelMap.addAttribute("role", new Role());
        modelMap.addAttribute("permissions", permissionService.findAll());
        return "/role/detail.ftl";
    }

    @RequiresPermissions("role:view")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String create(ModelMap modelMap, @PathVariable("id") Long id) {

        modelMap.addAttribute("role", roleService.findOne(id));
        modelMap.addAttribute("permissions", permissionService.findByRole(id));

        return "/role/detail.ftl";
    }

    @RequiresPermissions("role:modify")
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(ModelMap modelMap, Role role) {

        role = roleService.createRole(role);
        for (Long permissionId : role.getPermissions()) {
            roleService.correlationPermissions(role.getId(), permissionId);
        }
        return "redirect:/role/all";
    }

    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(ModelMap modelMap,
                         @RequestParam(value = "id", required = false, defaultValue = "") Long id) {
        //删除角色
        roleService.deleteRole(id);
        //删除关联关系
        roleService.deletePermissionByRole(id);
        return "redirect:/role/all";
    }
}
