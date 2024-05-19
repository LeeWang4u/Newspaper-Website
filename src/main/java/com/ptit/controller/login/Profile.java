package com.ptit.controller.login;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.Comment;
import com.ptit.Entities.User;
import com.ptit.Service.CommentService;
import com.ptit.Service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.context.request.WebRequest;

import java.util.List;

@Controller
@AllArgsConstructor
@SessionAttributes("userdto")
public class Profile {
    private UserService userService;
    private CommentService commentService;
    @ModelAttribute("userdto")
    public UserDto userDto() {return new UserDto();}
    @GetMapping("/profile")
    public String showSettingUser(){
        return "profile";
    }
    @PostMapping("/changeProfile")
    public String changeProfile( @ModelAttribute("userdto") UserDto userDto,  Model model) {
        UserDto currentUser = (UserDto) model.getAttribute("userdto");
       userService.update(currentUser);
        return "profile";
    }
    @PostMapping("/changePass")
    public String changePass(@ModelAttribute("Userdto") UserDto userDto,Model model,@RequestParam("pass") String pass,@RequestParam("pass1") String pass1,@RequestParam("pass2") String pass2 ){
        UserDto currentUser = (UserDto) model.getAttribute("userdto");
        if(userService.checkPassWordUserWithBcrypt(pass.trim(),currentUser)){
            if(pass1.trim().equals(pass2.trim())){

                userService.changePass(currentUser,pass1.trim());
                return  "redirect:/profile?success";
            }
            else{
                return "redirect:/profile?wrongconfirm";
            }
        }
        return "redirect:/profile?wrongpass";
    }
    @PostMapping("/deleteAcc")
    public String deleteAcc(@ModelAttribute("userdto") UserDto userDto,Model model, WebRequest request, SessionStatus status){
        UserDto currentUser = (UserDto) model.getAttribute("userdto");
        User user = userService.getUserByEmail(currentUser.getEmail());
        List<Comment> comments = commentService.findByEmailOrderByIdCmtDesc(user);
        System.out.println(comments);
        for(Comment cmt : comments){
            commentService.delete(cmt);
        }
        userService.delete(user);
        status.setComplete();
        request.removeAttribute("userdto",WebRequest.SCOPE_SESSION);
       return "redirect:/user/home/page/1";
    }
}
