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
import com.Entity.User;

@WebServlet("/register")
public class registerServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String fname=req.getParameter("fullname");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String qualification=req.getParameter("Qualification");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		User user=new User(fname,email,phone,qualification,password,role);
		
		jobDAO dao=new jobDAO(DBConnection.getConnection());		
		HttpSession session=req.getSession(); 	
		
		boolean f=dao.register(user);
		if(f) {
			//System.out.print("Inserted");
			session.setAttribute("success","user Added Sucessfully");
			resp.sendRedirect("login.jsp");
		}
		else {
			//System.out.print("Not Inserted");
			session.setAttribute("error","Something Went Wrong!!");
			resp.sendRedirect("index.jsp");
		}
		
	}

	
}
