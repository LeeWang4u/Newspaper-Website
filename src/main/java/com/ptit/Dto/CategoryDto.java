package com.ptit.Dto;

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
public class CategoryDto implements Serializable {
    @NotBlank(message = "Category name is mandatory")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Category name can only contain letters and spaces")
    @NoBlankSpacesOnly(message = "Category name cannot be only blank spaces")
    String categoryName;

    @NotBlank(message = "Category description is mandatory")
    @Pattern(regexp = "^[a-zA-Z\\s]+$", message = "Category description can only contain letters and spaces")
    @NoBlankSpacesOnly(message = "Category description cannot be only blank spaces")
    String categoryDescribe;
}