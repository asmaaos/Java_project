package com.FahadMVC.pro.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.FahadMVC.pro.models.Project;
import com.FahadMVC.pro.models.User;
import com.FahadMVC.pro.services.ProjectService;
import com.FahadMVC.pro.services.UserService;

@Controller
public class ProjectControle {
	
	@Autowired
	private UserService userServ;
	@Autowired
	private ProjectService protSer;

	@GetMapping("/newproject")
	public String ProjectForm(HttpSession session, @ModelAttribute("newProject") Project newProject,Model model) {
	if(session.getAttribute("user_id") == null) {
		return "redirect:/";
	}else{

	    return "newProjectForm.jsp";
	}
	}
	@PostMapping("/createproject")
	public String CreatingProject(HttpSession session , @Valid@ModelAttribute("newProject") Project newProject,BindingResult result ,Model model) {
	if(session.getAttribute("user_id") == null) {
		return "redirect:/";
	}else{
	    if(result.hasErrors()) {
	        return "newProjectForm.jsp";
	    }else {
		User user = userServ.findUser((Long) session.getAttribute("user_id"));
		protSer.create(user, newProject);
	    return "redirect:/home";
	}
	
	
	}
	
	
	
	}
	
	}
	
	

