package com.FahadMVC.pro.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.FahadMVC.pro.models.Project;
import com.FahadMVC.pro.models.Task;
import com.FahadMVC.pro.models.User;

public interface TaskRepo extends CrudRepository<Task,Long> {
	
	List<Task> findAll();
	List<Task> findAllByUser(User user);
	List<Task> findAllByProject(Project project);
	List<Task> findAllByDescriptionContaining(String string);
}
