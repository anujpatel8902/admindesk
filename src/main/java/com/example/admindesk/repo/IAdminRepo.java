package com.example.admindesk.repo;

import com.example.admindesk.model.Admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IAdminRepo extends JpaRepository<Admin, Integer> {
    Admin findByEmail(String email);

    @Query("SELECT a FROM Admin a WHERE a.email = :email AND a.password = :password")
    Admin loginAdmin(@Param("email") String email, @Param("password") String password);
}
