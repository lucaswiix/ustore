package com.hellokoding.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hellokoding.auth.model.Action;
import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.ActionRepository;
import com.hellokoding.auth.repository.UserRepository;

@Controller
public class ActionController {

	@Autowired
	private ActionRepository actionRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@RequestMapping("/actions")
	public String ustore(Model model, Authentication auth) {
		
		if(auth != null && auth.getName() != null) 
    	{    		
    		User user = userRepository.findByUsername(auth.getName());  
    		
    		if(user.getPermission() != null)
        	{
    			if(!user.getPermission().equals("SARUMAN")){
    				return "redirect:/panel/";
    			}	    			
    		}
        }
		
		model.addAttribute("actions", actionRepository.findAll());
		return "show-actions";
	}

	
	@GetMapping("/new/action")
	public String addAction(Model model, Action action, Authentication auth) {
		
		if(auth != null && auth.getName() != null) 
    	{    		
    		User user = userRepository.findByUsername(auth.getName()); 
    		
    		if(user.getPermission() != null)
        	{
    			if(!user.getPermission().equals("SARUMAN")){
    				return "redirect:/panel/";
    			}	    			
    		}
        }
		
		model.addAttribute("users", userRepository.findByPermission("USER"));
		 return "add-action";
	}
	
	@PostMapping("/new/action")
	public ModelAndView addAction(Action action, ModelAndView modelAndView, Authentication auth) {
		
		if(auth != null && auth.getName() != null) 
    	{    		
    		User user = userRepository.findByUsername(auth.getName());  
    		
    		if(user.getPermission() != null)
        	{
    			if(!user.getPermission().equals("SARUMAN")){
    				return new ModelAndView("redirect:/panel/");
    			}	    			
    		}
        }
		
		if(auth != null && auth.getName() != null) {
			action.setExec(false);
			actionRepository.save(action);
			modelAndView.addObject("success","Action send successfully!");
			modelAndView.setViewName("redirect:/actions");	
		
			return modelAndView;
		
		}else {
			return new ModelAndView("redirect:/panel?error");
		}		
		
	}
	
	@GetMapping("/actions/exec/{id}")
	public String execActions(@PathVariable("id") long id, Authentication auth) {
		
		if(auth != null && auth.getName() != null) {
			User user = userRepository.findByUsername(auth.getName());
		
		
			Action action = actionRepository.findById(id);
		if(action != null) {		
			user.setArea(action.getArea());
			user.setGrouping(action.getGrupo());
			userRepository.save(user);
		
			action.setExec(true);
			actionRepository.save(action);
		
			return "redirect:/panel/";
		}else {
			return "redirect:/panel";
		}
		
		}else {
			return "redirect:/";
		}		

	}
	
	
}
