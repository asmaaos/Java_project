package com.FahadMVC.pro.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
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

import com.FahadMVC.pro.models.Project;
import com.FahadMVC.pro.models.Task;
import com.FahadMVC.pro.models.User;
import com.FahadMVC.pro.services.ProjectService;
import com.FahadMVC.pro.services.TaskService;
import com.FahadMVC.pro.services.UserService;

@Controller
public class HomeControle {

@Autowired
private UserService userServ;
@Autowired
private ProjectService proSer;
@Autowired
private TaskService taskSer;
	
	
	
	@GetMapping("/home")
	public String Home( HttpSession session ,Model model) {
		if(session.getAttribute("user") == null) {
			return "redirect:/";
		}if((Long) session.getAttribute("user_id") != 1) {
			return "redirect:/homes";
		}else{
	   User user = (User)session.getAttribute("user");
       model.addAttribute("user",user);
	   List <Project> projects = proSer.AllbyUser(user);
	   List <User> users = userServ.all();
	   model.addAttribute("users",users);
	   model.addAttribute("projects",projects);
	    return "Home.jsp";
	}}
	
	@GetMapping("/user/{id}")
	public String ShowEmployee(@PathVariable("id") Long id , HttpSession session ,Model model) {
		if(session.getAttribute("user") == null) {
			return "redirect:/";
		}if((Long) session.getAttribute("user_id") != 1) {
				return "redirect:/homes";
		}else{
	   User user = userServ.findUser(id);
	   List <Task> tasks = taskSer.UserTask(user);
	   String help = userServ.Pre(user,tasks);
       model.addAttribute("stats",help);
       model.addAttribute("user",user);
       model.addAttribute("tasks",tasks);
	    return "EmpoyeeShow.jsp";
	}}
	
	@GetMapping("/homes")
	public String EmployeeHome( HttpSession session ,Model model) {
		if(session.getAttribute("user") == null) {
			return "redirect:/";
		}else{
	   User user = (User)session.getAttribute("user");
	   List <Task> tasks = taskSer.UserTask(user);
       model.addAttribute("user",user);
       model.addAttribute("tasks",tasks);
	    return "EmpoyeeHome.jsp";
	}}
	
	@GetMapping("/task/{id}")
	public String taskdone(@PathVariable("id") Long id ) {
		Task task = taskSer.findbyid(id);
		taskSer.done(task);
		 return "redirect:/home";
	}
	@GetMapping("showproject/{project_id}/taskundone/{id}")
	public String taskndoneinPro(@PathVariable("id") Long id ,@PathVariable("project_id") Long Pro_id ) {
		Task task = taskSer.findbyid(id);
		taskSer.undone(task);
		 return "redirect:/showproject/{project_id}";
	}
	
	@GetMapping("showproject/{project_id}/task/{id}")
	public String taskdoneinPro(@PathVariable("id") Long id ,@PathVariable("project_id") Long Pro_id ) {
		Task task = taskSer.findbyid(id);
		taskSer.done(task);
		 return "redirect:/showproject/{project_id}";
	}
	@GetMapping("/taskundone/{id}")
	public String taskndone(@PathVariable("id") Long id ) {
		Task task = taskSer.findbyid(id);
		taskSer.undone(task);
		 return "redirect:/home";
	}
	
	@GetMapping("/done/{id}")
	public String done(@PathVariable("id") Long id ) {
		Project project = proSer.FindByID(id);
		proSer.stats(project);
		 return "redirect:/home";
	}
	
	@GetMapping("/undone/{id}")
	public String undone(@PathVariable("id") Long id ) {
		Project project = proSer.FindByID(id);
		proSer.unstats(project);
		 return "redirect:/home";
	}
	
	
	@GetMapping("/showproject/{id}")
	public String ShowProject(@PathVariable("id") Long id , @ModelAttribute("newtask") Task task,Model model,HttpSession session) {
		Project project = proSer.FindByID(id);
		proSer.Pre(project);
		 model.addAttribute("project",project);
		 List<Task> tasks = taskSer.ProjectTask(project);
		 model.addAttribute("tasks",tasks);
		   List <User> users = userServ.all();
		 model.addAttribute("users",users);
		   Long user_id = (Long)session.getAttribute("user_id");
		   User user = userServ.findUser(user_id);
		   model.addAttribute("siguinUser",user);
		   
		 return "showProject.jsp";
	}
	
	@PostMapping("/CreateTask/{id}")
	public String createTask(@PathVariable("id") Long id,@Valid@ModelAttribute("newtask") Task task,  BindingResult result,HttpSession session,@RequestParam("user_id")Long user_id,Model model) {
		Project project =proSer.FindByID(id);
		User user = userServ.findUser(user_id);
	    if(result.hasErrors()) {
			 model.addAttribute("project",project);
			 List<Task> tasks = taskSer.ProjectTask(project);
			 model.addAttribute("tasks",tasks);
			   List <User> users = userServ.all();
			 model.addAttribute("users",users);
			   Long sign_user_id = (Long)session.getAttribute("user_id");
			   User sign_user = userServ.findUser(sign_user_id);
			   model.addAttribute("siguinUser",sign_user);
	        return "showProject.jsp";
	    }else {
	    	taskSer.create(project, task,user);
	    return "redirect:/showproject/{id}";
	}}
	
	@GetMapping("/employee")
	public String employee(@ModelAttribute("newEmployee") User newUser) {
	    return "UserForm.jsp";
	}
	
	@PostMapping("/addemployee")
	public String addemployee(@Valid @ModelAttribute("newEmployee") User newUser, 
	        BindingResult result, Model model, HttpSession session) {
	    userServ.addemployee(newUser, result);
	    if(result.hasErrors()) {
	        return "UserForm.jsp";
	    }
	    return "redirect:/home";
	}
	
	
	@GetMapping("/lookingfor")
	public String searchB(@RequestParam(value="help", required=false) String search,HttpSession session,Model model) {
		List<Task> tasks = taskSer.sreach(search);
		model.addAttribute("search",search);
		model.addAttribute("tasks",tasks);
	    User user = (User)session.getAttribute("user");
		model.addAttribute("siguinUser",user);
		return "Search.jsp";
	}
	
	
	}



