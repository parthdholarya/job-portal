package com.Entity;

import java.sql.Date;

public class addJob {
	private int id;
	private String jobtitle;
	private String companyname;
	private String location;
	private Double salary;
	private String experiance;
	private String qualification;
	private String category;
	private String jobtype;
	private String description;
	private Date publishdate;
	private boolean isactive;
	
	public addJob(String jobtitle, String cname, String location, Double salary,String experiance,String qualification, String category, String jobtype, String desc) {
		super();
		this.jobtitle = jobtitle;
		this.companyname = cname;
		this.location = location;
		this.salary = salary;
		this.experiance=experiance;
		this.qualification=qualification;
		this.category = category;
		this.jobtype = jobtype;
		this.description = desc;
	}

	public addJob(int id, String jobtitle, String companyname, String location, Double salary, String category,
			String jobtype, String description,Date publishdate,
			 boolean isactive,String experiance,String qualification) {
		super();
		this.id = id;
		this.jobtitle = jobtitle;
		this.companyname = companyname;
		this.location = location;
		this.salary = salary;
		this.category = category;
		this.jobtype = jobtype;
		this.description = description;
		this.publishdate=publishdate;
		this.isactive=isactive;
		this.experiance=experiance;
		this.qualification=qualification;
		

	}
	


	public addJob(int id, String jobtitle, String companyname, String location, Double salary, String experiance,
			String qualification, String category, String jobtype, String description) {
		super();
		this.id = id;
		this.jobtitle = jobtitle;
		this.companyname = companyname;
		this.location = location;
		this.salary = salary;
		this.experiance = experiance;
		this.qualification = qualification;
		this.category = category;
		this.jobtype = jobtype;
		this.description = description;
	}



	public String getExperiance() {
		return experiance;
	}



	public void setExperiance(String experiance) {
		this.experiance = experiance;
	}



	public String getQualification() {
		return qualification;
	}



	public void setQualification(String qualification) {
		this.qualification = qualification;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getJobtitle() {
		return jobtitle;
	}

	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}

	public String getCompanyname() {
		return companyname;
	}

	public void setCompanyname(String companyname) {
		this.companyname = companyname;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Double getSalary() {
		return salary;
	}

	public void setSalary(Double salary) {
		this.salary = salary;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getJobtype() {
		return jobtype;
	}

	public void setJobtype(String jobtype) {
		this.jobtype = jobtype;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getPublishdate() {
		return publishdate;
	}

	public void setPublishdate(Date date) {
		this.publishdate = date;
	}

	public boolean getisIsactive() {
		return isactive;
	}

	public void setIsactive(boolean isactive) {
		this.isactive = isactive;
	}

	@Override
	public String toString() {
		return "addJob [id=" + id + ", jobtitle=" + jobtitle + ", companyname=" + companyname + ", location=" + location
				+ ", salary=" + salary + ", category=" + category + ", jobtype=" + jobtype + ", description="
				+ description + ", publishdate=" + publishdate + ", isactive=" + isactive + "]";
	}

	
	

	
	
}
