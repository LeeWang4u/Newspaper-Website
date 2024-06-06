package com.ptit.Validations;

import com.ptit.Dto.UserDto;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class UserValidation implements Validator {
    @Override
    public boolean supports(Class<?> clazz) {
        return UserDto.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        UserDto userDto = (UserDto) target;

        if (userDto.getEmail() == null || userDto.getEmail().isEmpty()) {
            errors.rejectValue("email", "NotEmpty.userDto.email", "Email is required");
        }
        if (userDto.getUserName() == null || userDto.getUserName().isEmpty()) {
            errors.rejectValue("userName", "NotEmpty.userDto.userName", "Username is required");
        }
        if (userDto.getPassWord() == null || userDto.getPassWord().isEmpty()) {
            errors.rejectValue("passWord", "NotEmpty.userDto.passWord", "Password is required");
        }
        if (!userDto.getEmail().matches("^\\w+@[a-zA-Z_]+?\\.[a-zA-Z]{2,3}$")) {
            errors.rejectValue("email", "Pattern.userDto.email", "Invalid email format");
        }
    }
}
