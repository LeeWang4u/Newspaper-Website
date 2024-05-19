package com.ptit.Service;

import com.ptit.Dto.UserDto;
import com.ptit.Entities.User;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Service;

@Service
public interface UserService {
    void save(UserDto userDto);
    Boolean checkPassWordUser(String email, String password);

    Boolean checkPassWordUserWithBcrypt(String request, UserDto user);

    Boolean checkUserByEmail(String email);
    User getUserByEmail(String email);
    Page<User> findAllByOrderByEmailDesc(int pageNum);
    void delete(User user);
    void update(UserDto userDto);
    void changePass(UserDto userDto,String pass);

}