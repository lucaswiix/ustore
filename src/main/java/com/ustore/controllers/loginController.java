package com.ustore.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class loginController {

	@GetMapping("/orc/login")
	public String orcLogin() {
		return "orc-login";
	}
	
	@PostMapping("/orc/login")
	public String orcLoginPost(@RequestParam("username") String username, @RequestParam("password") String password) {
		
		
		
		return username;		
	}
	
	@GetMapping("/saruman/login")
	public String sarumanLogin() {
		
		return "saruman-login";
	}
	
	@PostMapping("/saruman/login")
	public String sarumanLoginSubmitted(@RequestParam("username") String username, @RequestParam("passworld") String password) {
		
		if(username == "saruman" && password == "admin") {
			return "panel/saruman";
		}else {
		return "saruman-login";
		}	
	}
	

}
