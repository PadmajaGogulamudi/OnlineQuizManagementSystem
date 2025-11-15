<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register - OnlineQuiz</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f7fb;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        background: #ffffff;
        width: 380px;
        padding: 25px 30px;
        border-radius: 12px;
        box-shadow: 0 4px 15px rgba(0,0,0,0.1);
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    label {
        display: block;
        margin-top: 10px;
        color: #444;
        font-weight: bold;
    }

    input[type="text"],
    input[type="password"],
    input[type="email"],
    select {
        width: 100%;
        padding: 10px;
        margin-top: 5px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
    }

    input[type="submit"] {
        width: 100%;
        background: #4CAF50;
        color: white;
        margin-top: 18px;
        padding: 10px;
        font-size: 16px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        transition: 0.3s;
    }

    input[type="submit"]:hover {
        background: #45a049;
    }

    .msg-success {
        color: green;
        text-align: center;
        margin-bottom: 10px;
    }

    .msg-error {
        color: red;
        text-align: center;
        margin-bottom: 10px;
    }

    p {
        text-align: center;
        margin-top: 15px;
    }

    a {
        color: #2a6fdb;
        text-decoration: none;
    }

    a:hover {
        text-decoration: underline;
    }

</style>

</head>
<body>

<div class="container">
  <h2>Create Account</h2>

  <%  
     String success = (String) session.getAttribute("successMsg");
     if (success != null) { %>
       <div class="msg-success"><%= success %></div>
  <%   session.removeAttribute("successMsg"); }

     String error = (String) request.getAttribute("error");
     if (error != null) { %>
       <div class="msg-error"><%= error %></div>
  <% } %>

  <form method="post" action="<%= request.getContextPath() %>/RegisterServlet">
      
      <label for="username">Username:</label>
      <input type="text" name="username" id="username" required maxlength="30"/>

      <label for="password">Password:</label>
      <input type="password" name="password" id="password" required maxlength="30"/>

      <label for="name">Full Name:</label>
      <input type="text" name="name" id="name" required maxlength="30"/>

      <label for="email">Email:</label>
      <input type="email" name="email" id="email" maxlength="40"/>

      <label for="role">Role:</label>
      <select name="role" id="role">
          <option value="student" selected>Student</option>
          <option value="teacher">Teacher</option>
          <option value="admin">Admin</option>
      </select>

      <input type="submit" value="Register"/>
  </form>

  <p>Already have an account? <a href="login.jsp">Login here</a>.</p>
</div>

</body>
</html>
