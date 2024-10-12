package com.voidmain.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.voidmain.dao.HibernateDAO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String username=request.getParameter("username").trim();
		String password=request.getParameter("password").trim();
		
		String role=HibernateDAO.isValidUser(username, password);
		
		if(!role.equals("0"))
		{
			request.getSession().setAttribute("username",username.toLowerCase());
			request.getSession().setAttribute("role",role);
			response.sendRedirect("viewposts.jsp");
		}
		else
		{
			response.sendRedirect("login.jsp?status=Invalid Username and Password");
		}
	}
}
