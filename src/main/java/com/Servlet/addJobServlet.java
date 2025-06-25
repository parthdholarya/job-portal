package com.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.jobDAO;
import com.DB.DBConnection;
import com.Entity.addJob;
@WebServlet("/addjob")
public class addJobServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String jobtitle=req.getParameter("jobTitle");
		String cname=req.getParameter("companyName");
		String  location=req.getParameter("location");
		Double salary = Double.parseDouble(req.getParameter("salary"));
		String experiance=req.getParameter("experiance");
		String qualification=req.getParameter("qualification");
		String category=req.getParameter("category");
		String jobtype=req.getParameter("jobType");
		String desc=req.getParameter("description");
		addJob addjob=new addJob(jobtitle,cname,location,salary,experiance,qualification,category,jobtype,desc);
		jobDAO dao=new jobDAO(DBConnection.getConnection());		
		HttpSession session=req.getSession(); 	
		
		boolean f=dao.newjob(addjob);
		if(f) {
			//System.out.print("Inserted");
			session.setAttribute("success","Job Added Sucessfully");
			resp.sendRedirect("postjob.jsp");
		}
		else {
			//System.out.print("NOt Inserted");
			session.setAttribute("error","Something Went Wrong!!");
			resp.sendRedirect("postjob.jsp");
		}
		
	}

	
			
}
