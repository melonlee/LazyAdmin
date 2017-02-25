package lazyadmin.web.controller;


import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by Melon on 17/2/23.
 */
@Controller
@RequestMapping("/auth")
public class AuthController {

    /**
     * 跳转至登录页面
     *
     * @return
     */
    @RequestMapping(method = RequestMethod.GET)
    public String index() {

        return "login.ftl";
    }

    @RequestMapping(value = "/login", method = {
            RequestMethod.POST})
    public String dashboard(HttpServletRequest req, Model model) {
        String error = null;
        UsernamePasswordToken token = new UsernamePasswordToken(req.getParameter("username"), req.getParameter("password"));
        token.setRememberMe(false);
        try {
            SecurityUtils.getSubject().login(token);
            error = "用户名ok";
        } catch (UnknownAccountException uae) {
            error = "用户名/密码错误";
        } catch (IncorrectCredentialsException ice) {
            error = "用户名/密码错误";
        } catch (LockedAccountException lae) {
            error = "用户名/密码错误";
        }
        model.addAttribute("error", error);
        System.out.println("------------------------------>>>>>>>>>>>>>>>>>>>>>>>>>>>>" + error);
        return "redirect:/admin/all";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout() {

        return "login.ftl";
    }

    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail() {

        return "video/detail.ftl";
    }

}
