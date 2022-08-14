package com.FahadMVC.pro.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.FahadMVC.pro.models.Project;
import com.FahadMVC.pro.models.User;

@Repository
public interface ProjectRepo extends CrudRepository<Project, Long> {
	List<Project> findAll();
	List<Project> findAllByUser(User user);
}
