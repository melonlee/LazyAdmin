package lazyadmin.web.controller;


import lazyadmin.entity.Permission;
import lazyadmin.service.PermissionService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * 1.权限CRUD
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("permission")
public class PermissionController {

    @Resource
    private PermissionService permissionService;

    @RequiresPermissions("permission:view")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap modelMap) {

        modelMap.addAttribute("permissions", permissionService.findAll());
        return "/permission/index.ftl";
    }

    @RequiresPermissions("permission:modify")
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(ModelMap modelMap, Permission p) {

        Permission per = null;

        if (null != p.getId()) {

        } else {
            permissionService.createPermission(p);
        }
        modelMap.addAttribute("permission", per);
        return "redirect:/permission/all";
    }

    @RequiresPermissions("permission:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(ModelMap modelMap,
                         @RequestParam(value = "id", required = false, defaultValue = "") Long id) {

        permissionService.deletePermission(id);
        return "redirect:/permission/all";
    }

}
