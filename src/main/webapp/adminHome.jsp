<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%
    // protect page: must be logged in and role == admin
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }
    if (!"admin".equalsIgnoreCase(user.getU_role())) {
        response.sendError(403, "Forbidden - admin only");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Admin Dashboard - OnlineQuiz</title>
  <style>
    :root{
      --primary:#0d6efd;
      --accent:#0b5ed7;
      --bg:#f5f7fb;
      --card:#fff;
      --muted:#666;
    }
    body{font-family:Segoe UI,Arial,Helvetica,sans-serif;background:var(--bg);margin:0;padding:0}
    header{background:linear-gradient(90deg,var(--primary),var(--accent));color:#fff;padding:16px 28px;display:flex;justify-content:space-between;align-items:center}
    header h1{margin:0;font-size:20px}
    header .user {font-size:14px;opacity:.95}
    .logout{background:#e74c3c;color:#fff;padding:8px 12px;border-radius:6px;text-decoration:none;font-weight:600}
    .container{max-width:1100px;margin:28px auto;padding:18px}
    .hero{display:flex;gap:18px;align-items:center;margin-bottom:18px}
    .stat{background:var(--card);padding:14px;border-radius:10px;box-shadow:0 6px 18px rgba(12,20,50,0.04);flex:1}
    .stat h2{margin:0 0 6px 0;font-size:20px}
    .grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(220px,1fr));gap:18px;margin-top:18px}
    .card{background:var(--card);padding:18px;border-radius:10px;box-shadow:0 6px 18px rgba(12,20,50,0.04);text-align:center;transition:transform .12s,box-shadow .12s}
    .card:hover{transform:translateY(-6px);box-shadow:0 10px 26px rgba(12,20,50,0.06)}
    .card h3{margin:8px 0;font-size:18px}
    .card p{color:var(--muted);margin:0 0 12px 0}
    .btn{display:inline-block;padding:9px 14px;border-radius:8px;text-decoration:none;font-weight:700}
    .btn-primary{background:var(--primary);color:#fff}
    .btn-outline{background:transparent;border:1px solid #ddd;color:#333}
    footer{text-align:center;color:#999;margin-top:22px;font-size:13px}
  </style>
</head>
<body>
  <header>
    <div>
      <h1>OnlineQuiz — Admin</h1>
      <div style="font-size:13px;margin-top:4px;color:rgba(255,255,255,0.95)">Manage questions • users • results</div>
    </div>
    <div>
      <span class="user" style="margin-right:12px">Signed in as: <strong><%= user.getU_name() %></strong></span>
      <a class="logout" href="<%= request.getContextPath() %>/LogoutServlet">Logout</a>
    </div>
  </header>

  <div class="container">
    <div class="hero">
      <div class="stat">
        <h2>Welcome, <%= user.getU_name() %></h2>
        <p>Use the options below to manage quizzes, users and view system results.</p>
      </div>
      <div style="min-width:230px;text-align:right">
        <a class="btn btn-primary" href="<%= request.getContextPath() %>/AdminStatsServlet">View Stats</a>
      </div>
    </div>

    <div class="grid">
      <div class="card">
        <h3>Manage Questions</h3>
        <p>Add / Edit / Delete quiz questions and categories.</p>
        <a class="btn btn-primary" href="<%= request.getContextPath() %>/AdminQuestionServlet">Go</a>
      </div>

      <div class="card">
        <h3>Manage Users</h3>
        <p>View user list, change roles, deactivate or delete accounts.</p>
        <a class="btn btn-outline" href="<%= request.getContextPath() %>/AdminUserServlet">Manage</a>
      </div>

      <div class="card">
        <h3>View All Results</h3>
        <p>See all quiz attempts, filter by user/date and export CSV.</p>
        <a class="btn btn-outline" href="<%= request.getContextPath() %>/AdminResultServlet">View</a>
      </div>

      <div class="card">
        <h3>Create Admin</h3>
        <p>Register new admin accounts (careful — privileged access).</p>
        <a class="btn btn-outline" href="<%= request.getContextPath() %>/AdminCreateServlet">Create</a>
      </div>

      <div class="card">
        <h3>Import Questions</h3>
        <p>Bulk upload questions (CSV) to seed the question bank.</p>
        <a class="btn btn-outline" href="<%= request.getContextPath() %>/AdminImportServlet">Upload</a>
      </div>

      <div class="card">
        <h3>Settings</h3>
        <p>Configure quiz length, time limits, and scoring rules.</p>
        <a class="btn btn-outline" href="<%= request.getContextPath() %>/AdminSettingsServlet">Settings</a>
      </div>
    </div>

    <footer>
      <p>Admin dashboard — use responsibly. Audit logs are recommended for production.</p>
    </footer>
  </div>
</body>
</html>
