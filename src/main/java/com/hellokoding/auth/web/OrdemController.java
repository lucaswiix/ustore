package com.hellokoding.auth.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hellokoding.auth.model.Ordem;
import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.ActionRepository;
import com.hellokoding.auth.repository.OrdemRepository;
import com.hellokoding.auth.repository.UserRepository;

@Controller
public class OrdemController {
	
	@Autowired
	private UserRepository userRepository;
	
	private OrdemRepository repository;
	
	@Autowired
	private ActionRepository actionRepository;

	OrdemController (OrdemRepository ordemRepository) {
	      this.repository = ordemRepository;
	  }
    
	 @GetMapping("/panel")
	 public String welcome(Model model, User usuario, Authentication auth) {
	    	
	    	
	    	if(auth != null && auth.getName() != null) 
	    	{
	    		User user = userRepository.findByUsername(auth.getName());  
	    		
		    		if(user.getPermission() != null)
		        	{	    			
		    			if(user.getPermission().equals("SARUMAN")){
		    				return "redirect:/panel/saruman";
		    			}else if(!user.getPermission().equals("USER")) {
		    				user.setPermission("USER");	
		    				System.out.println("[1] Adicionado permission USER para: "+user.getUsername());
		    			}	    			
		    		}else{
		    			user.setPermission("USER");
		    			System.out.println("[2] Adicionado permission USER para: "+user.getUsername());
		    		}
	    		
	    		model.addAttribute("order", repository.findByAreaAndGrupo(user.getArea(), user.getGrouping()));
	    		
	    		model.addAttribute("actions", actionRepository.findBysoldierId(user.getId()));
	    		  
	    		return "panel";
	        }else {
	        	return "redirect:/";
	        }
	    	
	    	
	  }
	 
	 
	 @GetMapping("/new/order")
	    public String showOrderForm(Ordem ordem, Authentication auth) {
	    	
	    	
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
		 
	        return "add-order";
	    }
	 
	 	@GetMapping("/orders")
	    public String showOrders(Model model, Ordem ordem, Authentication auth) {
	    	
	    	
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
	    	
	    	model.addAttribute("order", repository.findAll());
	        return "show-orders";
	    }
	 
	 
	 
	@PostMapping("/new/order")
	public ModelAndView addOrder(Ordem ordem, ModelAndView modelAndView, Authentication auth) {
    	
    	
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
    	
		repository.save(ordem);		
		modelAndView.addObject("success","Order sent successfully!");
		modelAndView.setViewName("redirect:/panel/saruman");	
		
		return modelAndView;
	}
	
	
}
