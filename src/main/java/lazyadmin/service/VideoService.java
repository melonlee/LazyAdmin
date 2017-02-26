package lazyadmin.service;

import lazyadmin.entity.Video;

import java.util.List;

/**
 * Created by Melon on 17/2/26.
 */
public interface VideoService {

    public Video create(Video video);

    public Video findOne(Long id);

    public List<Video> findAll();

    public void delete(Long id);

    public Video modify(Video video);
}
