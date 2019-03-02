package com.hellokoding.auth.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

@Component
public class DemoData implements ApplicationRunner  {

	@Autowired
	private addUserService addUserService;
	
	@Override
    public void run(ApplicationArguments args) throws Exception {

			// Usei a criptografia no service, se tiver se perguntando =)
		
	//Soldados ( Login= soldier/user)
		
		//Globins    		
		addUserService.createDemo("soldier", "goblins", "isengard", "user", "USER");
		addUserService.createDemo("soldier1", "goblins", "isengard", "user", "USER");
		addUserService.createDemo("soldier2", "goblins", "rohan", "user", "USER");
		
		//Uruk-hais
		addUserService.createDemo("soldier3", "uruk-hais", "orthanc", "user", "USER");
		addUserService.createDemo("soldier4", "uruk-hais", "isengard", "user", "USER");
		addUserService.createDemo("soldier5", "uruk-hais", "rohan", "user", "USER");
		
		//Snagas
		addUserService.createDemo("soldier6", "snagas", "orthanc ", "user", "USER");
		addUserService.createDemo("soldier7", "snagas", "isengard ", "user", "USER");
		addUserService.createDemo("soldier8", "snagas", "rohan ", "user", "USER");
		
	//Saruman (Login= saruman/saruman)
	addUserService.createDemo("saruman", "saruman", "isengard", "saruman", "SARUMAN");
	
	
    }
	
}
