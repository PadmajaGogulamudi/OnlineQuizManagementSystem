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
 * ProfileServlet - GET shows profile page; POST updates profile then redirects (PRG).
 */
public class ProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ProfileServlet() {
        super();
    }

    // GET: show edit form (reads user from session, sets messages if any)
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        // user always available in session
        User u = (User) s.getAttribute("user");
        req.setAttribute("user", u);

        // transfer one-time messages from session to request (and remove them)
        String msg = (String) s.getAttribute("profileMsg");
        String err = (String) s.getAttribute("profileError");
        if (msg != null) {
            req.setAttribute("message", msg);
            s.removeAttribute("profileMsg");
        }
        if (err != null) {
            req.setAttribute("error", err);
            s.removeAttribute("profileError");
        }

        req.getRequestDispatcher("editProfile.jsp").forward(req, resp);
    }

    // POST: update profile, put one-time message in session, redirect to GET
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession s = req.getSession(false);
        if (s == null || s.getAttribute("user") == null) {
            resp.sendRedirect(req.getContextPath() + "/login.jsp");
            return;
        }

        User u = (User) s.getAttribute("user");

        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String email = req.getParameter("email");

        // Validation
        if (name == null || name.trim().isEmpty()) {
            s.setAttribute("profileError", "Name is required.");
            resp.sendRedirect(req.getContextPath() + "/ProfileServlet");
            return;
        }

        // If no password provided, keep existing one (don't set to null)
        if (password == null || password.trim().isEmpty()) {
            password = u.getU_password();
        } else {
            // optional: hash password here before storing
            // password = BCrypt.hashpw(password, BCrypt.gensalt());
        }

        u.setU_password(password);
        u.setU_name(name);
        u.setU_email(email);

        UserDao dao = new UserDao();
        boolean ok = dao.updateUser(u);
        if (ok) {
            s.setAttribute("user", u);
            s.setAttribute("profileMsg", "Profile updated successfully.");
        } else {
            s.setAttribute("profileError", "Update failed.");
        }
        resp.sendRedirect(req.getContextPath() + "/ProfileServlet");
    }

}
