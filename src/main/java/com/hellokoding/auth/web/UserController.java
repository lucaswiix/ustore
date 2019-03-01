package com.hellokoding.auth.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.OrdemRepository;
import com.hellokoding.auth.repository.UserRepository;
import com.hellokoding.auth.service.SecurityService;
import com.hellokoding.auth.service.UserService;
import com.hellokoding.auth.validator.UserValidator;

@Controller
public class UserController {
	
    @Autowired
    private UserService userService;
    
    @Autowired
    private UserRepository userRepository;
    
    
    private OrdemRepository ordemRepository;

    
    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @GetMapping("/registration")
    public String registration(Model model, Authentication auth) {
    	
    	
    	if(auth != null && auth.getName() != null) 
    	{    		
    		User user = userRepository.findByUsername(auth.getName());  
    		
    		if(user.getPermission() != null)
        	{
    			if(user.getPermission().equals("SARUMAN")){
    				return "redirect:/panel/saruman";
    			}
    			else if(user.getPermission().equals("USER")) {
    				return "redirect:/panel";
    			}
    		}
        }  
    	
        model.addAttribute("userForm", new User());

        return "registration";
    }


    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("userForm") User userForm, BindingResult bindingResult, Authentication auth) {
    	
    	
    	if(auth != null && auth.getName() != null) 
    	{    		
    		User user = userRepository.findByUsername(auth.getName());  
    		
    		if(user.getPermission() != null)
        	{
    			if(user.getPermission().equals("SARUMAN")){
    				return "redirect:/panel/saruman";
    			}
    			else if(user.getPermission().equals("USER")) {
    				return "redirect:/panel";
    			}
    		}
        }   
    	
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        
        userForm.setPermission("USER");
        
        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
    	
       
        return "redirect:/panel";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout, Authentication auth) {

    	if(auth != null && auth.getName() != null) 
    	{    		
    		User user = userRepository.findByUsername(auth.getName());  
    		
    		if(user.getPermission() != null)
        	{
    			if(user.getPermission().equals("SARUMAN")){
    				return "redirect:/panel/saruman";
    			}
    			else if(user.getPermission().equals("USER")) {
    				return "redirect:/panel";
    			}
    		}
        }   
    	
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping("/saruman/login")
    public String loginSaruman(Model model, String error, String logout, Authentication auth) {
    	
    	if(auth != null && auth.getName() != null) 
    	{    		
    		User user = userRepository.findByUsername(auth.getName());  
    		
    		if(user.getPermission() != null)
        	{
    			if(user.getPermission().equals("SARUMAN")){
    				return "redirect:/panel/saruman";
    			}
    			else if(user.getPermission().equals("USER")) {
    				return "redirect:/panel";
    			}
    		}
        }
    	
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "sarumanLogin";
    }
   
    
    @GetMapping("/panel/saruman")
    public String saruman(Model model, Authentication auth) {
    	
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
    	
        	
    	model.addAttribute("user", userRepository.findByPermission("USER"));
        return "panelsaruman";
    }
    
    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model, Authentication auth) {
    	
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
    	
    	User user = userRepository.findById(id);
    	if(user == null) {
    		return "redirect:/panel/saruman";
    	}
    		     
    		    model.addAttribute("user", user);
    		    return "update-orc";
    }
    
    @PostMapping("/update/{id}")
    public ModelAndView updateUser(@PathVariable("id") long id, @ModelAttribute("user") @Valid User user, 
      BindingResult result, Model model, ModelAndView modelAndView, Authentication auth) {
    	
    	
    
    	if(auth != null && auth.getName() != null) 
    	{    		
    		User usuario = userRepository.findByUsername(auth.getName());  
    		
    		if(usuario.getPermission() != null)
        	{
    			if(!usuario.getPermission().equals("SARUMAN")){
    				return new ModelAndView("redirect:/panel/");
    			}
    		}
        }
    	
    	
       /* if (result.hasErrors()) {
        	System.out.println(result.getAllErrors());
            user.setId(id);
            modelAndView.setViewName("update-orc");
            return modelAndView;
        }*/
    	
    	User updated = userRepository.findById(id);      
    	if(updated != null) {
	        updated.setArea(user.getArea());
	        updated.setGrouping(user.getGrouping());
	        userRepository.save(updated);
    	}else {
    		return new ModelAndView("redirect:/panel/saruman");
    	}
    	
        //userRepository.save(user);
        model.addAttribute("users", updated);
                
        modelAndView.addObject("success", "The soldier "+updated.getUsername()+" of <b>"+updated.getGrouping()+ "</b> group is in <b>"+updated.getArea()+"</b>!");
        
        modelAndView.setViewName("update-orc");
        //O correto seria redirecionar, para não forçar o reevenio do formulário no f5, se tiver tempo eu faço
        
        return modelAndView;
    }
    
   
    @GetMapping("/delete/{id}")
    public ModelAndView deleteUser(@PathVariable("id") long id, Model model, ModelAndView md, Authentication auth) {
    	
    	
    	if(auth != null && auth.getName() != null) 
    	{
    		User usuario = userRepository.findByUsername(auth.getName());  
    		
    		if(usuario.getPermission() != null)
        	{
    			if(!usuario.getPermission().equals("SARUMAN")){
    				return new ModelAndView( "redirect:/panel/");
    			}
    		}
        }
    	
        User user = userRepository.findById(id);
        User Userauth = userRepository.findByUsername(auth.getName());
                
        if(Userauth.getId().equals(id)) {
        	md.addObject("error", "You can't delete your self!");
        	return new ModelAndView( "redirect:/delete/"+id); 
        }
        
        userRepository.delete(user);
        model.addAttribute("users", userRepository.findAll());
        
        md.addObject("success", "Soldier deleted successfully!");
        
        return new ModelAndView( "redirect:/panel/saruman");
    }
    
}
