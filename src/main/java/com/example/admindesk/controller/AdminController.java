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

import java.time.LocalDate;

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
    @GetMapping("/login")
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
                        model.addAttribute("adminName", admin.getName());
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
    public String showAddHRForm(Model model) {
        log.info("Inside @class AdminController @Method showAddHRForm");
        model.addAttribute("showForm",false);
        return "addHR";
    }

    @PostMapping("/addHR-data")
    public String addHr(@RequestParam(required = false) String name,
                        @RequestParam(required = false) String email,
                        @RequestParam(required = false) String password,
                        @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate dob,
                        @RequestParam(required = false) String designation,
                        @RequestParam(required = false) @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate joiningDate,
                        RedirectAttributes redirectAttributes) {
        log.info("Inside @class AdminController @Method showAddHRForm email {}",email);

        try {
            if (designation != null && designation.equalsIgnoreCase("HR")) {
                if (adminService.hrExistsByEmail(email)) {
                    redirectAttributes.addFlashAttribute("error", "Email already exists!");
                    return "redirect:/admin/addHR";
                }
                HR hr = adminService.addHr(name, email, password, dob, designation, joiningDate);
                if (hr != null) {
                    redirectAttributes.addFlashAttribute("success", "Data saved successfully!");
                    return "redirect:/admin/addHR";
                } else {
                    redirectAttributes.addFlashAttribute("error", "Something went wrong!");
                    return "redirect:/admin/addHR";
                }
            } else if (designation != null && designation.equalsIgnoreCase("Manager")) {
                if (adminService.ManagerExistsByEmail(email)) {
                    redirectAttributes.addFlashAttribute("error", "Email already exists!");
                    return "redirect:/admin/addHR";
                }
                Manager manager = adminService.addManager(name, email, password, dob, designation, joiningDate);
                if (manager != null) {
                    redirectAttributes.addFlashAttribute("success", "Data saved successfully");
                    return "redirect:/admin/addHR";
                } else {
                    redirectAttributes.addFlashAttribute("error", "Something went wrong!");
                    return "redirect:/admin/addHR";
                }
            } else {
                redirectAttributes.addFlashAttribute("error", "Something went wrong!");
                return "redirect:/admin/addHR";
            }
        }catch (Exception e){
            log.info("Inside @class AdminController and @method addHr e {}",e.getStackTrace());
            redirectAttributes.addFlashAttribute("error", "Something went wrong!");
            return "redirect:/admin/addHR";
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
