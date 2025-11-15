<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page import="com.model.User" %>
<%
    // Prefer request attribute (set by doGet), fallback to session
    User u = (User) request.getAttribute("user");
    if (u == null) {
        u = (User) session.getAttribute("user");
    }
    if (u == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
        return;
    }

    String message = (String) request.getAttribute("message");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Profile</title>
  <style>
    body { font-family: Arial, sans-serif; background:#f7f9fc; padding:30px; }
    .box { max-width:520px; margin:40px auto; background:#fff; padding:20px; border-radius:8px; box-shadow:0 6px 18px rgba(0,0,0,0.06); }
    label { display:block; margin-top:12px; font-weight:600; color:#333; }
    input[type=text], input[type=password], input[type=email] { width:100%; padding:10px; margin-top:6px; border:1px solid #ddd; border-radius:6px; }
    .btn { margin-top:18px; padding:10px 16px; background:#007bff; color:#fff; border:none; border-radius:6px; cursor:pointer; font-weight:600; }
    .msg { padding:10px; margin-bottom:12px; border-radius:6px; }
    .success { background:#e6ffed; color:#1a7f37; border:1px solid #c6f0d0; }
    .err { background:#ffecec; color:#b00020; border:1px solid #f0c6c6; }
  </style>
</head>
<body>
  <div class="box">
    <h2>Edit Profile</h2>

    <% if (message != null) { %>
      <div class="msg success"><%= message %></div>
    <% } %>
    <% if (error != null) { %>
      <div class="msg err"><%= error %></div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/ProfileServlet">
        <label>Username:</label>
        <div style="padding:8px 10px; background:#fafafa; border-radius:6px; border:1px solid #eee;"><b><%= u.getUser_name() %></b></div>

        <label>Password:</label>
        <!-- In production, don't pre-fill password. For learning it's acceptable. -->
        <input type="password" name="password" value="<%= u.getU_password() != null ? u.getU_password() : "" %>" required />

        <label>Full Name:</label>
        <input type="text" name="name" value="<%= u.getU_name() != null ? u.getU_name() : "" %>" required />

        <label>Email:</label>
        <input type="email" name="email" value="<%= u.getU_email() != null ? u.getU_email() : "" %>" />

        <button class="btn" type="submit">Save Changes</button>
    </form>

    <p style="margin-top:12px;"><a href="<%= request.getContextPath() %>/studentHome.jsp">← Back to Home</a></p>
  </div>
</body>
</html>
