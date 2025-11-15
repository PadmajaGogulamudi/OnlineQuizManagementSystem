package com.controllers;

import java.io.IOException;
import java.util.List;

import com.dao.QuestionDao;
import com.model.Question;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class QuizServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        QuestionDao qdao = new QuestionDao();
        List<Question> qs = qdao.getQuestions(5); // number of questions
        // store in session for grading later
        session.setAttribute("currentQuestions", qs);
        // also set as request attribute for immediate rendering
        req.setAttribute("questions", qs);

        RequestDispatcher rd = req.getRequestDispatcher("quiz.jsp");
        rd.forward(req, resp);
    }
}
