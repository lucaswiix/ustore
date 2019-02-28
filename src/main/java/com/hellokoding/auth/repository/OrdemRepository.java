package com.hellokoding.auth.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import com.hellokoding.auth.model.Ordem;

@Repository
public interface OrdemRepository 
    extends JpaRepository<Ordem, Long> { }
