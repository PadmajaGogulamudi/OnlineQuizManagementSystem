package com.controllers;

import java.io.IOException;
import java.util.List;

import com.dao.ResultDao;
import com.model.Question;
import com.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class SubmitQuizServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession(false);
        if (session == null || session.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        List<Question> qs = (List<Question>) session.getAttribute("currentQuestions");
        if (qs == null) {
            resp.sendRedirect(req.getContextPath() + "/QuizServlet");
            return;
        }

        int score = 0, total = 0;
        for (Question q : qs) {
            total += q.getMarks();
            String ans = req.getParameter("q_" + q.getQ_id()); // ensure getter matches
            if (ans != null && ans.equalsIgnoreCase(q.getCorrectOption())) {
                score += q.getMarks();
            }
        }

        User user = (User) session.getAttribute("user");
        new ResultDao().saveResult(user.getUser_id(), score, total);

        session.removeAttribute("currentQuestions");
        req.setAttribute("score", score);
        req.setAttribute("total", total);
        req.getRequestDispatcher("result.jsp").forward(req, resp);
    }
}
