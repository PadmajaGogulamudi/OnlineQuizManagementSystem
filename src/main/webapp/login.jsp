<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - OnlineQuiz</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.2);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
            color: #555;
        }
        input, select {
            width: 100%;
            padding: 8px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        input[type=submit] {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
        }
        input[type=submit]:hover {
            background-color: #0056b3;
        }
        .error { 
            color: red; 
            text-align: center; 
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Login</h2>

    <% 
        String error = (String) request.getAttribute("error");
        if (error != null) { 
    %>
        <p class="error"><%= error %></p>
    <% } %>

    <form action="<%= request.getContextPath() %>/LoginServlet" method="post">

        <label for="role">Select Role:</label>
        <select name="role" id="role" required>
            <option value="">-- Select Role --</option>
            <option value="student">Student</option>
            <option value="teacher">Teacher</option>
            <option value="admin">Admin</option>
        </select>

        <label for="username">Username:</label>
        <input type="text" name="username" id="username" required />

        <label for="password">Password:</label>
        <input type="password" name="password" id="password" required />

        <input type="submit" value="Login" />
    </form>

    <p style="text-align:center; margin-top:15px;">
        Don’t have an account? <a href="register.jsp">Register here</a>.
    </p>
</div>
</body>
</html>
