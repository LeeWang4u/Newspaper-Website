package com.ptit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class access {

    @GetMapping("/access-denied")
    public String accessDenied() {
        return "access-denied";
    }
}