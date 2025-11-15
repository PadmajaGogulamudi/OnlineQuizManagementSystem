<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%
    // Session & role check
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    // Optional: ensure only students access this page
    if (!"student".equalsIgnoreCase(user.getU_role())) {
        response.sendError(403, "Forbidden - only students allowed");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Dashboard - OnlineQuiz</title>
    <style>
        :root {
            --primary: #007bff;
            --accent: #0056b3;
            --card-bg: #fff;
            --page-bg: #f4f7fb;
            --muted: #666;
        }
        body {
            font-family: "Segoe UI", Tahoma, Arial, sans-serif;
            background: var(--page-bg);
            margin: 0;
            padding: 0;
        }
        header {
            background: linear-gradient(90deg, var(--primary), var(--accent));
            color: white;
            padding: 18px 30px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }
        header .left {
            display: flex;
            align-items: center;
            gap: 16px;
        }
        header h1 {
            margin: 0;
            font-size: 20px;
            letter-spacing: .2px;
        }
        header .user-info {
            font-size: 14px;
            opacity: .95;
        }
        .logout {
            color: white;
            text-decoration: none;
            background: #e55353;
            padding: 8px 12px;
            border-radius: 6px;
            font-weight: 600;
        }
        .container {
            max-width: 1000px;
            margin: 30px auto;
            padding: 20px;
        }
        .welcome {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 24px;
            margin-bottom: 20px;
        }
        .welcome .greeting {
            background: var(--card-bg);
            padding: 18px;
            border-radius: 10px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.05);
            flex: 1;
        }
        .welcome .greeting h2 {
            margin: 0 0 6px 0;
            font-size: 20px;
        }
        .welcome .greeting p {
            margin: 0;
            color: var(--muted);
            font-size: 14px;
        }

        /* Options grid */
        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 18px;
        }
        .card {
            background: var(--card-bg);
            padding: 18px;
            border-radius: 10px;
            box-shadow: 0 6px 18px rgba(20,20,50,0.04);
            text-align: center;
            transition: transform .12s ease, box-shadow .12s ease;
        }
        .card:hover {
            transform: translateY(-6px);
            box-shadow: 0 10px 28px rgba(20,20,50,0.07);
        }
        .card h3 {
            margin: 0 0 8px 0;
            font-size: 18px;
        }
        .card p {
            margin: 0 0 14px 0;
            color: var(--muted);
            font-size: 14px;
        }
        .btn {
            display: inline-block;
            padding: 10px 16px;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 600;
        }
        .btn-primary {
            background: var(--primary);
            color: #fff;
        }
        .btn-outline {
            background: transparent;
            border: 1px solid #ddd;
            color: #333;
        }

        footer {
            text-align: center;
            color: #999;
            margin-top: 28px;
            font-size: 13px;
        }

        /* small screens */
        @media (max-width: 480px) {
            header h1 { font-size: 16px; }
        }
    </style>
</head>
<body>
<header>
    <div class="left">
        <h1>OnlineQuiz</h1>
        <div class="user-info">Student Dashboard</div>
    </div>
    <div>
        <span style="margin-right:12px;color:rgba(255,255,255,0.9);font-weight:600;">
            <%= user.getU_name() %>
        </span>
        <a class="logout" href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </div>
</header>

<div class="container">
    <div class="welcome">
        <div class="greeting">
            <h2>Welcome, <%= user.getU_name() %> 👋</h2>
            <p>Role: <strong><%= user.getU_role() %></strong> &nbsp; | &nbsp; Email: <%= user.getU_email() %></p>
        </div>
        <div style="min-width:200px;text-align:right;">
            <p style="margin:0;color:#666;font-size:13px;">Quick actions</p>
            <a class="btn btn-primary" href="<%= request.getContextPath() %>/QuizServlet">Start Quiz</a>
        </div>
    </div>

    <div class="grid">
        <div class="card">
            <h3>Start Quiz</h3>
            <p>Begin a new timed quiz. Questions are selected randomly.</p>
            <a class="btn btn-primary" href="<%= request.getContextPath() %>/QuizServlet">Start</a>
        </div>

        <div class="card">
            <h3>View Results</h3>
            <p>See your past quiz attempts and scores.</p>
            <a class="btn btn-outline" href="<%= request.getContextPath() %>/ResultServlet">View Results</a>
        </div>

        <div class="card">
            <h3>Edit Profile</h3>
            <p>Update your name, password, or email address.</p>
            <a class="btn btn-outline" href="<%= request.getContextPath() %>/ProfileServlet">Edit Profile</a>
        </div>

        <div class="card">
            <h3>Help / Instructions</h3>
            <p>How quizzes work, scoring rules and tips to prepare.</p>
            <a class="btn btn-outline" href="<%= request.getContextPath() %>/help.jsp">Read</a>
        </div>
    </div>

    <footer>
        <p>Tip: Click <strong>Start</strong> to begin your quiz. Good luck! 🍀</p>
    </footer>
</div>
</body>
</html>
