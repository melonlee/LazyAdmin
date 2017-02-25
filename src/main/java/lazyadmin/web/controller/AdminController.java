package lazyadmin.web.controller;

import lazyadmin.entity.Admin;
import lazyadmin.entity.Role;
import lazyadmin.service.AdminService;
import lazyadmin.service.RoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
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
@RequestMapping("/admin")
public class AdminController {

    @Resource
    private AdminService adminService;

    @Resource
    private RoleService roleService;

    @RequiresRoles("admin")
    @RequiresPermissions("admin:view")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap map) {

        List<Admin> admins = adminService.findAll();
        map.addAttribute("admins", admins);
        return "/account/index.ftl";
    }

    @RequiresPermissions("admin:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap modelMap) {
        modelMap.addAttribute("admin", new Admin());
        modelMap.addAttribute("roles", roleService.findAll());
        return "/account/detail.ftl";
    }

    @RequiresPermissions("admin:view")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String create(ModelMap modelMap, @PathVariable("id") Long id) {

        modelMap.addAttribute("admin", adminService.findOne(id));
        modelMap.addAttribute("roles", roleService.findByAdmin(id));

        return "/account/detail.ftl";
    }

    @RequiresPermissions("role:modify")
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Admin admin) {

        admin = adminService.createAdmin(admin);
        for (Long roleId : admin.getRoles()) {
            adminService.correlationRoles(admin.getId(), roleId);
        }
        return "redirect:/admin/all";
    }

    @RequiresPermissions("role:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(ModelMap modelMap,
                         @RequestParam(value = "id", required = false, defaultValue = "") Long id) {
        //删除角色
        adminService.delete(id);
        //删除关联关系
        adminService.uncorrelationRoles(id);
        return "redirect:/role/all";
    }

}
