package com.ptit.Service.impl;

import com.ptit.Dto.PostDto;
import com.ptit.Entities.Category;
import com.ptit.Entities.Post;
import com.ptit.Repository.PostRepository;
import com.ptit.Service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;


@Service
public class PostServiceImpl implements PostService {
    @Autowired
    private PostRepository postRepository;

    @Override

    public void save(PostDto postDto){
        LocalDateTime date = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedDateTime = date.format(formatter);
        Post post = new Post(postDto.getTitle(),postDto.getContentPost(),postDto.getImage(),formattedDateTime, postDto.getUser(), postDto.getCategory()   );
        postRepository.save(post);
    }

    @Override
    public void delete(int id){
        postRepository.deleteByIdPost(id);
    }


    @Override
    public void update(PostDto postDto, int id){
        Post post = postRepository.findPostByIdPost(id);
//        if (post == null) {
//            return null;
//        }
        post.setTitle(postDto.getTitle());
        post.setContentPost(postDto.getContentPost());

        postRepository.save(post);
    }

    @Override

    public Page<Post> findAllByOrderByIdPostDesc(int pageNum) {
        int pageSize = 5;

        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);

        return postRepository.findAllByOrderByIdPostDesc(pageable);
    }

    @Override
    public Post getPostbyIdPost(int id) {
        return postRepository.findPostByIdPost(id);
    }

    @Override
    public Page<Post> findByIdCategoryOrderByIdPostDesc(int pageNum, Category category) {
        int pageSize = 5;
        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);
        return postRepository.findByIdCategoryOrderByIdPostDesc(pageable,category);
    }
}
