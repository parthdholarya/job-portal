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
@WebServlet("/deletejob")
public class deleteServlet extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		jobDAO dao=new jobDAO(DBConnection.getConnection());
		boolean f=dao.deletejob(id);
		HttpSession session=req.getSession(); 	
		if(f) {
			//System.out.print("Inserted");
			session.setAttribute("sucess","Delete Sucessfully");
			resp.sendRedirect("viewjob.jsp");
		}
		else {
			//System.out.print("NOt Inserted");
			session.setAttribute("error","Something Went Wrong!!");
			resp.sendRedirect("viewjob.jsp");
		}
	}

	
}
