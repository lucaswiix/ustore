package com.hellokoding.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hellokoding.auth.model.User;
import com.hellokoding.auth.service.GroupAndArea;

public interface extendsUserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
    
    
    
}