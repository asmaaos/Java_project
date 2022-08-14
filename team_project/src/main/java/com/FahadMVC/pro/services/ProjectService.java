package com.FahadMVC.pro.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.FahadMVC.pro.models.Project;
import com.FahadMVC.pro.models.Task;
import com.FahadMVC.pro.models.User;
import com.FahadMVC.pro.repository.ProjectRepo;

@Service
public class ProjectService {
	@Autowired
	private ProjectRepo proRpo; 
	
	public List<Project> All(){
		return proRpo.findAll();
	}
	
	public List<Project> AllbyUser(User user){
		return proRpo.findAllByUser(user);
	}
	
	public Project create(User user , Project project) {
		// the admin set is here 
		project.setUser(user);
		project.setStatus(true);
		project.setPer(0);
		return proRpo.save(project);
	}
	
	public Project stats(Project pro) {
		pro.setStatus(false);
		return proRpo.save(pro);
	}
	
	public Project unstats(Project pro) {
		pro.setStatus(true);
		return proRpo.save(pro);
	}
	
	
	public Project Pre(Project pro) {
		if(pro.getTasks().size() != 0) {
		double 	 sum = 0;
		
		
		for(Task task: pro.getTasks()) {
			if(task.isStatus()) {
				sum++;
			}
		}
		double firstStep = sum / pro.getTasks().size();
		double total= firstStep * 100;
		pro.setPer(total);
		return proRpo.save(pro);
	}else {
		return null;
	}
	}
	
	
	public Project FindByID(Long id) {
		return proRpo.findById(id).get();
		
	}

}
