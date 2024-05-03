package com.ptit.Service;

import com.ptit.Dto.PostDto;
import com.ptit.Entities.Category;
import com.ptit.Entities.Post;
import com.ptit.Dto.PostDto;
import com.ptit.Entities.User;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;


@Service
public interface PostService {


    void save(PostDto postDto, String image);

    void delete(int id);

    void update(String title, String contentPost, String image, Category category, int id);


  //  void update(PostDto postDto, int id);

     Page<Post> findAllByOrderByIdPostDesc(int pageNum);
     Post getPostbyIdPost(int id);
     Page<Post> findByIdCategoryOrderByIdPostDesc(int pageNum, Category category);
     Page<Post> findByKeyword(String key,int pageNum);
    }
