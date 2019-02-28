package com.hellokoding.auth.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hellokoding.auth.model.Ordem;
import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.OrdemRepository;

@Controller
public class OrdemController {
	
	private OrdemRepository repository;

	OrdemController (OrdemRepository ordemRepository) {
	      this.repository = ordemRepository;
	  }
    
	 @GetMapping("/panel")
	 public String welcome(Model model, User usuario) {
		 
		 if(usuario.getPermission() != null && usuario.getPermission().equals("SARUMAN"))
	    	{
	    		return "redirect:/panel/SARUMAN";		
	    	}
		 
		 
	   model.addAttribute("order", repository.findAll());
	      return "panel";
	  }
	 
	 
	 @GetMapping("/new/order")
	    public String showOrderForm(Ordem ordem, User usuario) {
		 if(usuario.getPermission() != null && !usuario.getPermission().equals("SARUMAN"))
	    	{
	    		return "redirect:/panel";		
	    	}
		 
	        return "add-order";
	    }
	 
	@PostMapping("/new/order")
	public ModelAndView addOrder(Ordem ordem, ModelAndView modelAndView, User usuario) {
		
		 if(usuario.getPermission() != null && !usuario.getPermission().equals("SARUMAN"))
	    	{
	    		return new ModelAndView( "redirect:/panel");
	    	}
		 
		repository.save(ordem);		
		modelAndView.addObject("success","Order sent successfully!");
		modelAndView.setViewName("panelsaruman");	
		
		return new ModelAndView( "redirect:/panel/saruman");
	}
	
	
}
