package com.example.admindesk.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;

@Controller
@RequestMapping("/admin") 
public class AdminController {

    @GetMapping("/check-ui")
    public String home() {
        return "home";
    }

    @GetMapping("/Service")
    public String isService(){
        return "Service is up";
    }
}
