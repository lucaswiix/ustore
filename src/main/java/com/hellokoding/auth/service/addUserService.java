package com.hellokoding.auth.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.UserRepository;

//Eu sei, ta na pasta service e é repositório, coloquei errado xD
@Repository
public class addUserService {
	
	@Autowired
	private UserRepository repository;

	public void createDemo(String username, String group, String area, String password, String permission) {
		
		User validationUsername = repository.findByUsername(username);		
		if(validationUsername != null)
			return;		
		
		User user = new User();
		if(permission.equals("SARUMAN"))
		{
			List<User> check  = repository.findByPermission("SARUMAN");
			if(check.size() >= 1) {
				return;
			}else {
				user.setPermission("SARUMAN");
			}
		}
		
		
		user.setUsername(username);
		user.setGrouping(group);
		user.setArea(area);
		
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String hashedPassword = passwordEncoder.encode(password);		
		user.setPassword(hashedPassword);
		
		repository.save(user);
	}
}
