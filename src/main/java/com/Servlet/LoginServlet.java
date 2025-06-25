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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String password=req.getParameter("password");
			//User l=new User(em,ps);
			jobDAO dao=new jobDAO(DBConnection.getConnection());
			User user = dao.login(email, password);
			if (user != null && user.getRole() != null) {
			    HttpSession session = req.getSession();
			    session.setAttribute("user", user);
			    session.setAttribute("email", user.getEmail()); 
			    if ("Admin".equals(user.getRole())) {
			        resp.sendRedirect("admin.jsp");
			    } else {
			        resp.sendRedirect("user.jsp");
			    }
			} else {
			    resp.sendRedirect("login.jsp");
			}
			

		}
	}