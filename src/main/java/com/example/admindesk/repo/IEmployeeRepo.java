package com.example.admindesk.repo;

import com.example.admindesk.model.Employee;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IEmployeeRepo extends JpaRepository<Employee, Integer> {
    @Query("SELECT e FROM Employee e WHERE e.email = :email AND e.password = :password")
    Employee loginEmployee(@Param("email") String email, @Param("password") String password);
}
