package com.example.admindesk.service;

import com.example.admindesk.model.HR;
import com.example.admindesk.repo.IHrRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class HRService {

    @Autowired
    IHrRepo ihrRepository;

    public HR loginHR(String email, String passWord){
        log.info("Inside @class HRService @method loginHR email,passWord {}{}",email,passWord);
        HR hr=ihrRepository.loginHr(email,passWord);
        return hr;
    }
}
