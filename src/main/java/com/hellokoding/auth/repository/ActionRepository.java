package com.hellokoding.auth.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.hellokoding.auth.model.Action;

@Repository
public interface ActionRepository extends JpaRepository<Action, Long>{
	Action findById(long id);
	List<Action> findAllByOrderByIdDesc();
	List<Action> findBysoldierId(long id);
	List<Action> findBysoldierIdOrderByIdDesc(long id);
}