package com.FahadMVC.pro.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FahadMVC.pro.models.Project;
import com.FahadMVC.pro.models.Task;
import com.FahadMVC.pro.models.User;
import com.FahadMVC.pro.repository.TaskRepo;

@Service
public class TaskService {
	@Autowired
	private TaskRepo taskRepo;
	
	
	
	public List<Task> all(){
		return taskRepo.findAll();
	}

	public Task create(Project project,Task task,User user) {
	task.setProject(project);
	task.setUser(user);
	return taskRepo.save(task);
}
	
	public Task findbyid(Long id) {
		return taskRepo.findById(id).get();
	}
	
	public Task done(Task task) {
		task.setStatus(true);
		return taskRepo.save(task);
	}
	
	public Task undone(Task task) {
		task.setStatus(false);
		return taskRepo.save(task);
	}
	public List<Task> UserTask(User user){
		return taskRepo.findAllByUser(user);
	}
	public List<Task> ProjectTask(Project project){
		return taskRepo.findAllByProject(project);
	}
	
	public List<Task> sreach(String string){
		return taskRepo.findAllByDescriptionContaining(string);
	}
}
