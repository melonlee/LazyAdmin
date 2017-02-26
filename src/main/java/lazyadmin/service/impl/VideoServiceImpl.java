package lazyadmin.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import lazyadmin.entity.Video;
import lazyadmin.mapper.VideoMapper;
import lazyadmin.service.VideoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by Melon on 17/2/26.
 */
@Service
public class VideoServiceImpl implements VideoService {

    @Resource
    private VideoMapper videoMapper;

    public Video create(Video video) {
        videoMapper.insert(video);
        return video;
    }

    public Video findOne(Long id) {
        return videoMapper.selectById(id);
    }

    public List<Video> findAll() {
        return videoMapper.selectList(new EntityWrapper<Video>());
    }

    public void delete(Long id) {
        videoMapper.deleteById(id);
    }

    public Video modify(Video video) {
        videoMapper.updateById(video);
        return video;
    }
}
