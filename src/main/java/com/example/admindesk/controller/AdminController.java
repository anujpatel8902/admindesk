package com.example.admindesk.controller;

import com.example.admindesk.model.Admin;
import com.example.admindesk.model.Employee;
import com.example.admindesk.model.HR;
import com.example.admindesk.model.Manager;
import com.example.admindesk.service.AdminService;
import com.example.admindesk.service.EmployeeService;
import com.example.admindesk.service.HRService;
import com.example.admindesk.service.ManagerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.http.ResponseEntity;
import org.springframework.http.HttpStatus;
import java.util.HashMap;
import java.util.Map;
import org.springframework.web.bind.annotation.ResponseBody;
import java.time.LocalDate;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.support.RequestContextUtils;


@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {

    @Autowired
    AdminService adminService;

    @Autowired
    HRService hrService;

    @Autowired
    ManagerService managerService;

    @Autowired
    EmployeeService employeeService;
    // Show login page
    @GetMapping("/**")
    public String showLoginPage() {
        return "login";
    }


    @GetMapping("/welcome")
    public String showWelcomePage(@RequestParam(required = false) String role, @RequestParam(required = false) String email, @RequestParam(required = false) String passWord, Model model) {
        if (role != null && email != null && passWord != null) {
            String welcomePage = "";

            switch (role.toUpperCase()) {
                case "ADMIN":
                    Admin admin = adminService.loginAdmin(email, passWord);
                    if (admin != null) {
                        model.addAttribute("name", admin.getName());
                        model.addAttribute("role", role);
                        welcomePage = "adminWelcome";
                    }
                    break;

                case "HR":
                    HR hr = hrService.loginHR(email, passWord);
                    if (hr != null) {
                        model.addAttribute("name", hr.getName());
                        model.addAttribute("role", role);
                        welcomePage = "hrWelcome";
                    }
                    break;

                case "MANAGER":
                    Manager manager = managerService.loginManager(email, passWord);
                    if (manager != null) {
                        model.addAttribute("name", manager.getName());
                        model.addAttribute("role", role);
                        welcomePage = "managerWelcome";
                    }
                    break;

                case "EMPLOYEE":
                    Employee employee = employeeService.loginEmployee(email, passWord);
                    if (employee != null) {
                        model.addAttribute("name", employee.getName());
                        model.addAttribute("role", role);
                        welcomePage = "employeeWelcome";
                    }
                    break;

                default:
                    log.warn("Unknown role: {}", role);
                    return "redirect:/admin/login";
            }

            if (!welcomePage.isEmpty()) {
                log.info("Inside @class AdminController @Method showWelcomePage for role: {}", role);
                return welcomePage;
            }
        }
        return "redirect:/admin/login";
    }

    @GetMapping("/addHR")
    public String showAddHRForm(HttpSession session) {
        System.out.println("SESSION SUCCESS: " + session.getAttribute("success"));
        return "addHR";
    }

    @PostMapping("/saveHR")
    @ResponseBody
    public ResponseEntity<Map<String, String>> saveHR(@ModelAttribute HR hr) {
        Map<String, String> response = new HashMap<>();
        try {
            // TODO: Add your HR saving logic here
            response.put("success", "Data saved successfully!");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response.put("error", "Failed to save HR: " + e.getMessage());
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(response);
        }
    }


    @GetMapping("/check-ui")
    public String home() {
        return "home";
    }

    @GetMapping("/Service")
    public String isService(){
        return "Service is up";
    }
}
