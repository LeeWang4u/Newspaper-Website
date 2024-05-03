package com.ptit.Repository;

import com.ptit.Entities.Category;
import com.ptit.Entities.Post;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.stereotype.Repository;

@Repository
@EnableJpaRepositories
public interface PostRepository extends JpaRepository<Post,Integer> {
    Page<Post> findAllByOrderByIdPostDesc(Pageable pageable);
    Page<Post> findByIdCategoryOrderByIdPostDesc(Pageable pageable, Category idCategory);
    Post findPostByIdPost(int idPost);

    Page<Post> findByTitleContainingOrderByIdPostDesc(String key,Pageable pageable);

    void deleteByIdPost(int idPost);


}