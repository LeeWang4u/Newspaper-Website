package com.ptit.Dto;

import com.ptit.Entities.Post;
import com.ptit.Entities.User;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDto implements Serializable {
    User user;
    private String contentCmt;
    Post post;

}
