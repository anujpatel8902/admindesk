package com.example.admindesk.service;

import com.example.admindesk.model.Admin;
import com.example.admindesk.model.HR;
import com.example.admindesk.model.Manager;
import com.example.admindesk.repo.IAdminRepo;
import com.example.admindesk.repo.IHrRepo;
import com.example.admindesk.repo.IManagerRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;

@Slf4j
@Service
public class AdminService {
    @Autowired
    IAdminRepo adminRepository;

    @Autowired
    IManagerRepo iManagerRepository;

    @Autowired
    IHrRepo ihrRepository;
    public Admin loginAdmin(String email,String passWord){
        log.info("Inside @class AdminService @method loginAdmin email,passWord {}{}",email,passWord);
        Admin admin=adminRepository.loginAdmin(email,passWord);
        return admin;
    }

    public HR addHr(String name, String email, String passWord, LocalDate dob, String designation, LocalDate joiningDate){

        HR hr=new HR();
        hr.setName(name);
        hr.setEmail(email);
        hr.setPassword(passWord);
        hr.setDob(dob);
        hr.setDesignation(designation);
        hr.setJoiningDate(joiningDate);
        Admin admin=adminRepository.findById(1).orElse(null);
        hr.setAdmin(admin);
        return ihrRepository.save(hr);
    }

    public Manager addManager(String name, String email, String passWord, LocalDate dob, String designation, LocalDate joiningDate){
        Manager manager=new Manager();
        manager.setName(name);
        manager.setEmail(email);
        manager.setPassword(passWord);
        manager.setDob(dob);
        manager.setDesignation(designation);
        manager.setJoiningDate(joiningDate);
        Admin admin=adminRepository.findById(1).orElse(null);
        manager.setAdmin(admin);
        return iManagerRepository.save(manager);
    }

    public boolean hrExistsByEmail(String email) {
        return ihrRepository.findByEmail(email) != null;
    }

    public boolean ManagerExistsByEmail(String email){
        return iManagerRepository.findByEmail(email) != null;
    }

}
