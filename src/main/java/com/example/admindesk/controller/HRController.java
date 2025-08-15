package com.example.admindesk.controller;

import com.example.admindesk.model.HR;
import com.example.admindesk.model.Manager;
import com.example.admindesk.service.HRService;
import com.example.admindesk.service.ManagerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;

@RequestMapping("/hr")
@Controller
@Slf4j
public class HRController {

    @Autowired
    ManagerService managerService;
    @Autowired
    HRService hrService;

    @GetMapping("/hr-login")
    public String showLoginPage() {
        return "hrLogin";
    }

    @GetMapping("/add-manager")
    public String showAddManagerForm() {
        log.info("Inside @class HRController @Method showAddManagerForm");
        return "addManager";
    }

    @PostMapping("/add-manager-data")
    public String addManager(@RequestParam(required = false) String name,
                              @RequestParam(required = false) String email,
                              @RequestParam(required = false) String password,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate dob,
                              @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate joiningDate,
                              RedirectAttributes redirectAttributes){
        log.info("Inside @class HRController @Method addManager email {}",email);

        try {
            if (hrService.ManagerExistsByEmail(email)) {
                redirectAttributes.addFlashAttribute("error", "Email already exists!");
                return "redirect:/hr/add-manager";
            }
            Manager manager = hrService.addManager(name, email, password, dob, "Manager", joiningDate);
            if (manager != null) {
                redirectAttributes.addFlashAttribute("success", "Data saved successfully!");
                return "redirect:/hr/add-manager";
            } else {
                redirectAttributes.addFlashAttribute("error", "Something went wrong!");
                return "redirect:/hr/add-manager";
            }
        }catch (Exception e){
            log.info("Inside @class HRController and @method addManager e {}",e.getStackTrace());
            redirectAttributes.addFlashAttribute("error", "Something went wrong!");
            return "redirect:/hr/add-manager";
        }

    }
}
