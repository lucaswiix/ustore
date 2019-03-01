package com.hellokoding.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hellokoding.auth.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	
    User findByUsername(String username);
    
    User findById(long id);
    
    List<User> findByPermission(String permission);
    
    List<User> findAll();
    
}
