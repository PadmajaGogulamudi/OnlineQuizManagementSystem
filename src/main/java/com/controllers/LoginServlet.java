package com.controllers;

import java.io.IOException;

import com.dao.UserDao;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// doPost()
		UserDao dao = new UserDao();
		String role = request.getParameter("role");
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		User user = dao.login(username, password, role);

		if (user == null) {
		    request.setAttribute("error", "Invalid username, password or role!");
		    request.getRequestDispatcher("login.jsp").forward(request, response);
		    return;
		}

		HttpSession session = request.getSession();
		session.setAttribute("user", user);

		// Redirect based on role
		switch(role) {
		    case "student":
		        response.sendRedirect("studentHome.jsp");
		        break;
		    case "teacher":
		        response.sendRedirect("teacherHome.jsp");
		        break;
		    case "admin":
		        response.sendRedirect("adminHome.jsp");
		        break;
		}


	}

}
