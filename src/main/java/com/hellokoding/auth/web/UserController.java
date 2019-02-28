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

import com.hellokoding.auth.model.Ordem;
import com.hellokoding.auth.model.User;
import com.hellokoding.auth.repository.OrdemRepository;
import com.hellokoding.auth.repository.UserRepository;
import com.hellokoding.auth.service.OrdemService;
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
    public String registration(@RequestParam("permission") String perm, @ModelAttribute("userForm") User userForm, BindingResult bindingResult) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autoLogin(userForm.getUsername(), userForm.getPasswordConfirm());
    	
        
        if(perm.equals("1")) {
        	return "redirect:/panel/saruman";
        }
        return "redirect:/panel";
    }

    @GetMapping("/login")
    public String login(Model model, String error, String logout) {
    	
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

   
    
    @GetMapping("/panel/saruman")
    public String saruman(Model model, User user) {
    	
    	model.addAttribute("user", userRepository.findAll());
        return "panelsaruman";
    }
    
    @GetMapping("/edit/{id}")
    public String showUpdateForm(@PathVariable("id") long id, Model model) {
        User user = userRepository.findById(id)
          .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
         
        model.addAttribute("user", user);
        return "update-orc";
    }
    
    @PostMapping("/update/{id}")
    public String updateUser(@PathVariable("id") long id, @Valid User user, 
      BindingResult result, Model model) {
        if (result.hasErrors()) {
            user.setId(id);
            return "update-orc";
        }
             
        userRepository.save(user);
        model.addAttribute("users", userRepository.findAll());
        return "panelsaruman";
    }
    
   
    @GetMapping("/delete/{id}")
    public String deleteUser(@PathVariable("id") long id, Model model) {
        User user = userRepository.findById(id)
          .orElseThrow(() -> new IllegalArgumentException("Invalid user Id:" + id));
        userRepository.delete(user);
        model.addAttribute("users", userRepository.findAll());
        return "panelsaruman";
    }
    
}
