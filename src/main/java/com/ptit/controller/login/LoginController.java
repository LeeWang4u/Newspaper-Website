package com.ptit.controller.login;

import ch.qos.logback.core.model.Model;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.User;
import com.ptit.Service.UserService;
import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@AllArgsConstructor
@SessionAttributes("userdto")
public class LoginController {
    private UserService userService;
@ModelAttribute("userdto")
public UserDto userDto() {return new UserDto();}

    @GetMapping("/login")
    public String showLoginForm(){
        return "login";
    }
    @PostMapping("/login")
    public String LoginUserAccount(@Valid @ModelAttribute("userdto") UserDto userDto, BindingResult bindingResult ,HttpSession session) {
    userDto.setUserName("Robot");
    if (bindingResult.hasErrors()) {
            System.out.println(bindingResult.getAllErrors());
            return "login";
        }
        if(!userService.checkUserByEmail(userDto.getEmail())){
            return "redirect:/login?emailwrong";
        }
        User user = userService.getUserByEmail(userDto.getEmail());
        userDto.setUserName(user.getUserName());
        userDto.setRole(user.getRole().trim());
        if(userService.checkPassWordUserWithBcrypt(userDto.getPassWord(), userDto)){
            session.setAttribute("loggedInUser", user);
            if(user.getRole().trim().equals("ROLE_ADMIN")){
                return  "redirect:/admin/home";
            }
            else{
                return "redirect:/user/home/page/1?success";
            }
        }
//        System.out.println(userDto.getPassWord());
//        System.out.println(userDto.getEmail());
        return "redirect:/login?passwordwrong";

    }
}
