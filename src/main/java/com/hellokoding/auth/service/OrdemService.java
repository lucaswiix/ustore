package com.hellokoding.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hellokoding.auth.model.Ordem;
import com.hellokoding.auth.repository.OrdemRepository;

@Service
public class OrdemService
{
	@Autowired
	private OrdemRepository repository;
	
	public List<Ordem> findAll() {
		return repository.findAll();
	}	
	
	public Ordem findOne(Long id) {
	    return repository.findById(id).orElse(null);
	}
	
	public Ordem save(Ordem ordem) {
		return repository.saveAndFlush(ordem);
	}
	
	public void delete(Long id) {
		repository.deleteById(id);
	}
}