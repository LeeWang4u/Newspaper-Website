package com.ptit.Dto;

import com.ptit.Validations.NoBlankSpacesOnly;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class UserDto implements Serializable {
    @Email(message = "Email should be valid")
    @NotBlank(message = "Email is mandatory")
    @Pattern(regexp = "^[a-zA-Z0-9@.]+$", message = "Email must not contain special characters")
    @NoBlankSpacesOnly(message = "Email name cannot be only blank spaces")
    private String Email;

    @NotBlank(message = "Username is mandatory")
    @Size(min = 3, max = 20, message = "Username must be between 3 and 20 characters")
    @Pattern(regexp = "^[a-zA-Z ]+$", message = "Username must only contain letters and spaces")
    @NoBlankSpacesOnly(message = "Username name cannot be only blank spaces")
    private String UserName;

    @NotBlank(message = "Password is mandatory")
    @Size(min = 5, message = "Password must be at least 5 characters")
    @Pattern(regexp = "^[a-zA-Z0-9]+$", message = "Password must not contain special characters")
    @NoBlankSpacesOnly(message = "Password name cannot be only blank spaces")
    private String PassWord;
    private String Role;
}
