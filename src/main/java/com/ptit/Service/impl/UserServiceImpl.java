package com.ptit.Service.impl;

import com.ptit.Dto.UserDto;
import com.ptit.Entities.User;
import com.ptit.Repository.UserRepository;
import com.ptit.Service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserRepository userRepository;

    @Override
    public void save(UserDto userDto){
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        String passWord = passwordEncoder.encode(userDto.getPassWord());

        User user = new User(userDto.getUserName(),userDto.getEmail(),passWord,"ROLE_USER");

        userRepository.save(user);
    }
    @Override
    public void update(UserDto userDto) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        String passWord = passwordEncoder.encode(userDto.getPassWord());
        User user = new User(userDto.getUserName(),userDto.getEmail(),passWord,userDto.getRole());
        userRepository.save(user);
    }

    @Override
    public void changePass(UserDto userDto, String pass) {
        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        String passWord = passwordEncoder.encode(pass);
        User user = new User(userDto.getUserName(),userDto.getEmail(),passWord,userDto.getRole());
        userRepository.save(user);
    }

    @Override
    public Boolean checkPassWordUser(String email, String password) {
        User user = userRepository.findUserByEmail(email);
        System.out.println(user.getPassWord());
        System.out.println(password);
        System.out.println(user.getPassWord().trim().equals(password.trim()));
        if (user.getPassWord().trim().equals(password.trim())) {
            return true;
        } else {
            return false;
        }
    }
    @Override
    public Boolean checkUserByEmail(String email) {
        User user = userRepository.findUserByEmail(email);
        if(user==null) return false;
        return true;
    }

    @Override
    public Boolean checkPassWordUserWithBcrypt(String request, UserDto userDto){
        User user = userRepository.findUserByEmail(userDto.getEmail());

        PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(10);
        return passwordEncoder.matches(request.trim(),user.getPassWord().trim());

    }
    @Override
    public User getUserByEmail(String email) {
        return userRepository.getUserByEmail(email);
    }

    @Override
    public Page<User> findAllByOrderByEmailDesc(int pageNum) {
        int pageSize = 5;

        Pageable pageable = PageRequest.of(pageNum - 1, pageSize);

        return userRepository.findAllByOrderByEmailDesc(pageable);
    }

    @Override
    public void delete(User user) {
        userRepository.delete(user);
    }



}