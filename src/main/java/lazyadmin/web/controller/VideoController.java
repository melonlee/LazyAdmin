package lazyadmin.web.controller;

import lazyadmin.entity.Video;
import lazyadmin.service.VideoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Melon on 17/2/26.
 */
@Controller
@RequestMapping("/video")
public class VideoController {

    @Resource
    private VideoService videoService;

    @RequiresPermissions("video:view")
    @RequestMapping(value = "/all", method = RequestMethod.GET)
    public String all(ModelMap map) {

        List<Video> videos = videoService.findAll();
        map.addAttribute("videos", videos);
        return "/video/index.ftl";
    }

    @RequiresPermissions("video:create")
    @RequestMapping(value = "/create", method = RequestMethod.GET)
    public String create(ModelMap map) {
        map.addAttribute("video", new Video());
        return "/video/detail.ftl";
    }

    @RequiresPermissions("video:view")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public String detail(ModelMap map, @PathVariable("id") Long id) {
        map.addAttribute("video", videoService.findOne(id));
        return "/video/detail.ftl";
    }

    @RequiresPermissions("video:modify")
    @RequestMapping(value = "/modify", method = RequestMethod.POST)
    public String modify(Video video) {

        videoService.modify(video);
        return "redirect:/video/all";
    }

    @RequiresPermissions("video:delete")
    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    public String delete(@RequestParam(value = "id", required = false, defaultValue = "") Long id) {
        videoService.delete(id);
        return "redirect:/video/all";
    }
}
