package com.hellokoding.auth.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

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
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }


    @PostMapping("/registration")
    public String registration(@Valid @ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
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
    public String login(Model model, String error, String logout, User usuario) {
    	
    	if(usuario.getPermission() != null && usuario.getPermission().equals("SARUMAN"))
    	{
    		return "redirect:/panel/saruman";
    	}
    	System.out.println(usuario.getPermission());
    	
    	if(usuario.getPermission() != null && usuario.getPermission().equals("USER"))
    	{
    		return "redirect:/panel";
    	}
    	
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @GetMapping("/saruman/login")
    public String loginSaruman(Model model, String error, String logout, User usuario) {
    	
    	if(usuario.getPermission() != null && usuario.getPermission().equals("SARUMAN"))
    	{
    		return "redirect:/panel/saruman";
    	}
    	
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "sarumanLogin";
    }
   
    
    @GetMapping("/panel/saruman")
    public String saruman(Model model, User user) {
    	
    	if(user.getPermission() != null && !user.getPermission().equals("SARUMAN"))
    	{
    		return "redirect:/panel";    		
    	}
    	
        	
    	model.addAttribute("user", userRepository.findAll());
        return "panelsaruman";
    }
    
    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model, User use) {
    	if(use.getPermission() != null && !use.getPermission().equals("SARUMAN"))
    	{
    		return "redirect:/panel";    		
    	}
    	
        User user = userRepository.findById(id)
        		
          .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
         
        model.addAttribute("user", user);
        return "update-orc";
    }
    
    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable("id") long id, @Valid User user, 
      BindingResult result, Model model, User usuario) {
    	if(usuario.getPermission() != null && !usuario.getPermission().equals("SARUMAN"))
    	{
    		return "redirect:/panel";    		
    	}
    	
        if (result.hasErrors()) {
            user.setId(id);
            return "update-orc";
        }
             
        userRepository.save(user);
        model.addAttribute("users", userRepository.findAll());
        return "redirect:/update/"+id;
    }
    
   
    @GetMapping("/delete/{id}")
    public ModelAndView deleteUser(@PathVariable("id") long id, Model model, ModelAndView md, User usuario) {
    	
    	if(usuario.getPermission() != null && !usuario.getPermission().equals("SARUMAN"))
    	{
    		return new ModelAndView( "redirect:/panel");		
    	}
    	
        User user = userRepository.findById(id)
          .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        
        if(user.getId().equals(id)) {
        	md.addObject("error", "You can't delete your self!");
        	return new ModelAndView( "redirect:/delete/"+id); 
        }
        
        userRepository.delete(user);
        model.addAttribute("users", userRepository.findAll());
        
        md.addObject("success", "Soldier deleted successfully!");
        
        return new ModelAndView( "redirect:/panel/saruman");
    }
    
}
