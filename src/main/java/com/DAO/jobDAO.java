package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.graalvm.compiler.core.GraalCompiler.Request;

import com.Entity.User;
import com.Entity.addJob;

public class jobDAO<email> {
	private Connection conn;

	public jobDAO(Connection conn) {
		super();
		this.conn = conn;
	}
	public User login(String email, String pass) {
	    User user = null;
	    try {
	        String sql = "SELECT email,role FROM users WHERE email=? AND password=?";
	        PreparedStatement prep = conn.prepareStatement(sql);
	        prep.setString(1, email);
	        prep.setString(2, pass);
	        ResultSet rs = prep.executeQuery();

	        if (rs.next()) {
	            user = new User();
	            user.setEmail(rs.getString("email"));  
	            user.setRole(rs.getString("role"));   
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}
	public User getProfile(String email) {
	    User user = null;
	    try {
	        System.out.println("Looking up user by email: " + email); // debug
	        String sql = "SELECT * FROM Users WHERE email=?";
	        PreparedStatement prep = conn.prepareStatement(sql);
	        prep.setString(1, email);
	        ResultSet rs = prep.executeQuery();

	        if (rs.next()) {
	            user = new User();
	            user.setId(rs.getInt("id"));
	            user.setName(rs.getString("FULLNAME"));
	            user.setEmail(rs.getString("EMAIL"));
	            user.setPhone(rs.getString("PHONE"));
	            user.setQualification(rs.getString("QUALIFICATION"));
	            user.setPassword(rs.getString("PASSWORD"));
	            user.setRole(rs.getString("ROLE"));
	        } else {
	            System.out.println("⚠️ No user found for this email in DB");
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return user;
	}

	
	public boolean  register(User user) {
		boolean success=false;
		try {
			String sql="insert into users(FULLNAME,EMAIL,PHONE,QUALIFICATION,PASSWORD,ROLE) values(?,?,?,?,?,?)";
			PreparedStatement prep=conn.prepareStatement(sql);
			prep.setString(1,user.getName());
			prep.setString(2,user.getEmail());
			prep.setString(3,user.getPhone());
			prep.setString(4,user.getQualification());
			prep.setString(5,user.getPassword());
			prep.setString(6,user.getRole());
			int a=prep.executeUpdate();
			if(a==1) {
				success=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return success;
	}
	
	public boolean  newjob(addJob job) {
		boolean success=false;
		try {
			String sql="insert into alljobs(jobtitle,companyname,location,salary,category,jobtype,description,experience,qualification) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement prep=conn.prepareStatement(sql);
			prep.setString(1,job.getJobtitle());
			prep.setString(2,job.getCompanyname());
			prep.setString(3, job.getLocation());
			prep.setDouble(4,job.getSalary());
			prep.setString(5,job.getCategory());
			prep.setString(6,job.getJobtype());
			prep.setString(7,job.getDescription());
			prep.setString(8,job.getExperiance());
			prep.setString(9,job.getQualification());
			int a=prep.executeUpdate();
			if(a==1) {
				success=true;
			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return success;
	}
//	public List<addJob> getAlljobs(){
//		List<addJob> list=new ArrayList<addJob>();
//		addJob job=null;
//		try {
//			String sql="select * from alljobs";
//			PreparedStatement prep=conn.prepareStatement(sql);
//			ResultSet rs=prep.executeQuery();
//			while(rs.next()) {
//				job=new addJob();
//				job.setId(rs.getInt(1));
//				job.setJobtitle(rs.getString(2));
//				job.setCompanyname(rs.getString(3));
//				job.setLocation(rs.getString(4));
//				job.setSalary(rs.getDouble(5));
//				job.setCategory(rs.getString(6));
//				job.setJobtype(rs.getString(7));
//				job.setDescription(rs.getString(8));
//				job.setPublishdate(rs.getDate(9));
//				job.setIsactive(rs.getBoolean(10));
//				list.add(job);
//				
//				
//			}
//		}catch(Exception e) {
//			e.printStackTrace();
//		}
//		return list;
//	}
	public addJob getJobById(int id) {
		addJob j=null;
		try {
			String sql="select * from alljobs where id=?";
			PreparedStatement prep=conn.prepareStatement(sql);
			prep.setInt(1, id);
			ResultSet rs=prep.executeQuery();
			while(rs.next()) {
				j=new addJob(
					    rs.getInt("id"),
					    rs.getString("JOBTITLE"),
					    rs.getString("COMPANYNAME"),
					    rs.getString("LOCATION"),
					    rs.getDouble("SALARY"),
					    rs.getString("CATEGORY"),
					    rs.getString("JOBTYPE"),
					    rs.getString("DESCRIPTION"),
					    rs.getDate("PUBLISH_DATE"),
					    rs.getBoolean("IS_ACTIVE"),
					    rs.getString("EXPERIENCE"),
					    rs.getString("QUALIFICATION")
					);

			}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	return j;
	}
	public boolean updatejob(addJob job) {
	    boolean success = false;
	    try {
	        String sql = "UPDATE alljobs SET jobtitle=?, companyname=?, location=?, salary=?, category=?, " +
	                     "jobtype=?, description=?, experience=?, qualification=? WHERE id=?";
	        PreparedStatement prep = conn.prepareStatement(sql);
	        prep.setString(1, job.getJobtitle());
	        prep.setString(2, job.getCompanyname());
	        prep.setString(3, job.getLocation());
	        prep.setDouble(4, job.getSalary());
	        prep.setString(5, job.getCategory());
	        prep.setString(6, job.getJobtype());
	        prep.setString(7, job.getDescription());
	        prep.setString(8, job.getExperiance());
	        prep.setString(9, job.getQualification());
	        prep.setInt(10, job.getId()); 

	        int a = prep.executeUpdate();
	        success = (a == 1);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return success;
	}

	public boolean deletejob(int id) {
		boolean success=false;
		try {
			String sql="delete from alljobs Where id=?";
			PreparedStatement prep=conn.prepareStatement(sql);
			prep.setInt(1, id);
			int i=prep.executeUpdate();
			if(i==1) {
				success=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return success;
	}
	//Filter job
	public List<addJob> getFilteredjob(String jobtitle, String types, String category, String active) {
	    List<addJob> list = new ArrayList<addJob>();
	    try {
	        String sql = "SELECT * FROM alljobs WHERE 1=1";

	        if (jobtitle != null && !jobtitle.isEmpty()) {
	            sql += " AND JOBTITLE LIKE ?";
	        }
	        if (types != null && !types.isEmpty()) {
	            sql += " AND JOBTYPE LIKE ?";
	        }
	        if (category != null && !category.isEmpty()) {
	            sql += " AND CATEGORY LIKE ?";
	        }
	        if (active != null && !active.isEmpty()) {
	            sql += " AND IS_ACTIVE = ?";
	        }

	        PreparedStatement prep = conn.prepareStatement(sql);
	        int i = 1;
	        if (jobtitle != null && !jobtitle.isEmpty()) prep.setString(i++, "%" + jobtitle + "%");
	        if (types != null && !types.isEmpty()) prep.setString(i++, "%" + types + "%");
	        if (category != null && !category.isEmpty()) prep.setString(i++, "%" + category + "%");
	        if (active != null && !active.isEmpty()) {
	            boolean isActive = Boolean.parseBoolean(active.trim());
	            prep.setBoolean(i++, isActive); 
	        }


	        System.out.println("SQL: " + prep);

	        ResultSet rs = prep.executeQuery();
	        while (rs.next()) {
	            addJob job = new addJob(
	                rs.getInt("ID"),
	                rs.getString("JOBTITLE"),
	                rs.getString("COMPANYNAME"),
	                rs.getString("LOCATION"),
	                rs.getDouble("SALARY"),
	                rs.getString("CATEGORY"),
	                rs.getString("JOBTYPE"),
	                rs.getString("DESCRIPTION"),
	                rs.getDate("PUBLISH_DATE"),
	                rs.getBoolean("IS_ACTIVE"),
	                rs.getString("EXPERIENCE"),
	                rs.getString("QUALIFICATION")
	            );
	            list.add(job);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return list;
	}

}
