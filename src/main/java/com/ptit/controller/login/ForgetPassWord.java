package com.ptit.controller.login;

import ch.qos.logback.core.model.Model;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.User;
import com.ptit.Service.MailerService;
import com.ptit.Service.UserService;
import jakarta.servlet.http.HttpSession;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.Random;

@Controller
@AllArgsConstructor

public class ForgetPassWord {
    @Autowired
    private MailerService mailerService;
    private UserService userService;

    @GetMapping("/forget-password")
    public String forgetPassWord(){
        return "admin/forgetPassWord";
    }

    @PostMapping("/forget-password")
    public String NewPassWord(@RequestParam("email") String email, HttpSession session,
                              @RequestParam("confirm_password") String confirm_password, @RequestParam("password") String password){

        if(userService.checkUserByEmail(email.trim())){
            return "admin/forgetPassWord";
        }

        if(password.equals(confirm_password.trim())){
            Random rand = new Random();
            int randomNum = 1000 + rand.nextInt(9000);
            String codeVerify = String.valueOf(randomNum);

            session.setAttribute("email", email);
            session.setAttribute("codeVerify", codeVerify);
            session.setAttribute("password", password);

            mailerService.send( "New24h-noreply", email, "Mã xác nhân từ New24h",mailerService.bodyReply(codeVerify));

            return "redirect:/verify-forget-password";
        }
        else{
            return "admin/forgetPassWord";
        }
    }

    @GetMapping("/verify-forget-password")
    public String enterVerifySignUp(){
        return "admin/verifyForgetPassWord";
    }

    @PostMapping("/verify-forget-password")
    public String VerifySignUp(HttpSession session, @RequestParam("code") String code){
        String email = (String)session.getAttribute("email");
        String codeVerify = (String)session.getAttribute("codeVerify");
        String password = (String)session.getAttribute("password");

        if(code.equals(codeVerify)){
            userService.changePassByEmail(email,password);
            return "redirect:/login?success";
        }

        return "redirect:/signUp?emailexist";

    }

}
