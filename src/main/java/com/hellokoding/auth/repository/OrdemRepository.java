package com.hellokoding.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.hellokoding.auth.model.Ordem;

@Repository
public interface OrdemRepository 
    extends JpaRepository<Ordem, Long> { 
	
	List<Ordem> findByAreaAndGrupo(String area, String grupo);
	
}
