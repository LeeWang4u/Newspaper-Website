package com.ptit.Dto;

import com.ptit.Entities.Post;
import com.ptit.Entities.User;
import com.ptit.Validations.NoBlankSpacesOnly;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CommentDto implements Serializable {
    User user;

    @NoBlankSpacesOnly(message = "Content name cannot be only blank spaces")
    private String contentCmt;

    Post post;

}
