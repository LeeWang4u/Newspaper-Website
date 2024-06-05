package com.ptit.controller.login;

import ch.qos.logback.core.model.Model;
import com.ptit.Dto.UserDto;
import com.ptit.Entities.User;
import com.ptit.Service.MailerService;
import com.ptit.Service.UserService;
import lombok.AllArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@AllArgsConstructor

public class ForgetPassWord {
    @Autowired
    private MailerService mailerService;

    @GetMapping("/forgetPassWord")
    public String forgetPassWord(){
        return "admin/forgetPassWord";
    }

    @PostMapping("/forgetPassWord")
    public String NewPassWord(@RequestParam("email") String email){

        String pass = "1234";

        String msg = "Mã xác nhận: ";

        msg = msg + pass;


        mailerService.send( "New24h-noreply", email, "Mã xác nhân từ New24h",mailerService.bodyReply(pass));


        return "admin/forgetPassWord";
    }


}
