package com.example.admindesk.service;

import com.example.admindesk.model.Employee;
import com.example.admindesk.repo.IEmployeeRepo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Slf4j
@Service
public class EmployeeService {

    @Autowired
    IEmployeeRepo iemployeeRepository;

    public Employee loginEmployee(String email, String passWord){
        log.info("Inside @class EmployeeService @method loginEmployee email,passWord {}{}",email,passWord);
        Employee employee=iemployeeRepository.loginEmployee(email,passWord);
        return employee;
    }
}
