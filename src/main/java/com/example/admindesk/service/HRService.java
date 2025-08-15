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

@Service
@Slf4j
public class HRService {

    @Autowired
    IManagerRepo iManagerRepo;

    @Autowired
    IHrRepo ihrRepository;

    @Autowired
    IAdminRepo iAdminRepo;

    public HR loginHR(String email, String passWord){
        log.info("Inside @class HRService @method loginHR email,passWord {}{}",email,passWord);
        HR hr=ihrRepository.loginHr(email,passWord);
        return hr;
    }

    public Manager addManager(String name, String email, String passWord, LocalDate dob, String designation, LocalDate joiningDate){
        Manager manager=new Manager();
        manager.setName(name);
        manager.setEmail(email);
        manager.setPassword(passWord);
        manager.setDob(dob);
        manager.setDesignation(designation);
        manager.setJoiningDate(joiningDate);
        Admin admin=iAdminRepo.findById(1).orElse(null);
        manager.setAdmin(admin);
        return iManagerRepo.save(manager);
    }



    public boolean ManagerExistsByEmail(String email){
        return iManagerRepo.findByEmail(email) != null;
    }
}
