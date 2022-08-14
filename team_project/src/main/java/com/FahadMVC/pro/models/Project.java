package com.FahadMVC.pro.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.format.annotation.DateTimeFormat;



@Entity
@Table(name="projects")
public class Project {
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

	@NotEmpty(message="Title is required!")
    @Size(min=3, max=30, message="title must be between 3 and 30 characters")
    private String title;
	
	@NotEmpty(message="Description is required!")
    @Size(min=1, max=200, message="description must be between 3 and 30 characters")
    private String description;
	@NotNull(message="Budget is required!")
	private double budget;
	

	private double per;
	
    @NotNull(message="Due Date is required!")
	@DateTimeFormat(pattern="yyyy-MM-dd")
    @Future
	private Date duedate;

    
    @ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="user_id")
	private User user;
    
    @OneToMany(mappedBy="project", fetch = FetchType.LAZY)
    private List<Task> Tasks;
    
    @Value("false")
    private boolean status;
    
    @Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
    @DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
	
	 
	 
		@PrePersist
	    protected void onCreate(){
	        this.createdAt = new Date();
	    }

	    @PreUpdate
	    protected void onUpdate(){
	        this.updatedAt = new Date();
	    }

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public double getBudget() {
			return budget;
		}

		public void setBudget(double budget) {
			this.budget = budget;
		}

		public Date getDuedate() {
			return duedate;
		}

		public void setDuedate(Date duedate) {
			this.duedate = duedate;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}

		public boolean isStatus() {
			return status;
		}

		public void setStatus(boolean status) {
			this.status = status;
		}

		public Date getUpdatedAt() {
			return updatedAt;
		}

		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}

		public Long getId() {
			return id;
		}

		public Date getCreatedAt() {
			return createdAt;
		}

		public double getPer() {
			return per;
		}

		public void setPer(double per) {
			this.per = per;
		}

		public List<Task> getTasks() {
			return Tasks;
		}

		public void setTasks(List<Task> tasks) {
			Tasks = tasks;
		}
	    
	    
    
}
