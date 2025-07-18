package com.example.admindesk.repo;

import com.example.admindesk.model.HR;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface IHrRepo extends JpaRepository<HR, Integer> {
    HR findByEmail(String email);

    @Query("SELECT h FROM HR h WHERE h.email = :email AND h.password = :password")
    HR loginHr(@Param("email") String email, @Param("password") String password);
}
