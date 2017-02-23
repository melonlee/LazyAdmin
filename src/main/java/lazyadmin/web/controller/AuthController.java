package lazyadmin.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
    @RequestMapping(value = "login", method = RequestMethod.GET)
    public String loginPage() {

        return "login.ftl";
    }

    @RequestMapping(value = "dashboard", method = {
            RequestMethod.GET})
    public String dashboard() {

        return "index.ftl";
//        return "redirect:/video.html";
    }

    @RequestMapping(value = "logout", method = RequestMethod.GET)
    public String logout() {

        return "login.ftl";
    }

    @RequestMapping(value = "detail", method = RequestMethod.GET)
    public String detail() {

        return "/dashboard/detail.ftl";
    }

}
