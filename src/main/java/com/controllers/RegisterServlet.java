package com.controllers;

import java.io.IOException;

import com.dao.UserDao;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String role = request.getParameter("role");
		User u = new User();
		u.setUser_name(username);
		u.setU_password(password); 

		u.setU_name(name);

		u.setU_email(email);
		u.setU_role(role);

		UserDao dao = new UserDao();
		if (dao.register(u))
			// after successful insertion into DB
			response.sendRedirect(request.getContextPath() + "/login.jsp?msg=registered"+username );

		else {
			request.setAttribute("error", "Registration failed");
			request.getRequestDispatcher("register.jsp").forward(request, response);
		}

	}

}
