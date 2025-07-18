package com.example.admindesk.repo;

import com.example.admindesk.model.Manager;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IManagerRepo extends JpaRepository<Manager, Integer> {
    Manager findByEmail(String email);

    @Query("SELECT m FROM Manager m WHERE m.email = :email AND m.password = :password")
    Manager loginManager(@Param("email") String email, @Param("password") String password);
}
