package com.controllers;

import java.io.IOException;
import java.util.List;

import com.dao.ResultDao;
import com.model.Result;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ResultServlet
 */
public class ResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) { resp.sendRedirect("login.jsp"); return; }
        User user = (User) session.getAttribute("user");
        ResultDao rdao = new ResultDao();
        List<Result> results = rdao.getResultsByUser(user.getUser_id());
        req.setAttribute("results", results);
        req.getRequestDispatcher("viewResults.jsp").forward(req, resp);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
