package com.example.admindesk.controller;

import com.example.admindesk.service.HRService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/hr")
@Controller
@Slf4j
public class HRController {
    @Autowired
    HRService hrService;

    @GetMapping("/hr-login")
    public String showLoginPage() {
        return "hrLogin";
    }
}
