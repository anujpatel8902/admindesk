package com.example.admindesk.service;

import com.example.admindesk.model.Manager;
import com.example.admindesk.repo.IManagerRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class ManagerService {
    @Autowired
    IManagerRepo iManagerRepository;

    public Manager loginManager(String email, String passWord) {
        log.info("Inside @class ManagerService @method loginManager email,passWord {}{}", email, passWord);
        return iManagerRepository.loginManager(email, passWord);
    }
}
