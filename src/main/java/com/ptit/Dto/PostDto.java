package com.ptit.Dto;

import com.ptit.Entities.Category;
import com.ptit.Entities.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostDto implements Serializable {
    String title;

    MultipartFile image;

    //String image;

    String contentPost;
    User user;
    Category category;

}