package com.ptit.Dto;

import com.ptit.Entities.Category;
import com.ptit.Entities.User;
import com.ptit.Validations.NoBlankSpacesOnly;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.web.multipart.MultipartFile;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class PostDto implements Serializable {
    @NotBlank(message = "Title is mandatory")
    @Size(max = 75, message = "Title must be at most 75 characters")
    @NoBlankSpacesOnly(message = "Title name cannot be only blank spaces")
    String title;

    @NotBlank(message = "Content is mandatory")
    @NoBlankSpacesOnly(message = "Content name cannot be only blank spaces")
    String contentPost;

    User user;

    Category category;

}