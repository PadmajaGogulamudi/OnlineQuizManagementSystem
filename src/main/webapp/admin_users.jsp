<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.User" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Manage Users - Admin</title>

  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f4f6fb;
      margin: 0;
      padding: 20px;
    }

    h2 {
      text-align: center;
      margin-bottom: 20px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: white;
    }

    th, td {
      border: 1px solid #ddd;
      padding: 10px;
      text-align: center;
    }

    th {
      background: #0d6efd;
      color: white;
    }

    .btn {
      padding: 6px 12px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 14px;
    }

    .btn-role {
      background: #0d6efd;
      color: white;
    }

    .btn-delete {
      background: #e74c3c;
      color: white;
    }

    .back {
      display: inline-block;
      margin-bottom: 16px;
      text-decoration: none;
      background: #6c757d;
      color: white;
      padding: 8px 14px;
      border-radius: 5px;
    }
  </style>
</head>

<body>

<a href="admin_home.jsp" class="back">← Back</a>

<h2>Manage Users</h2>

<table>
  <tr>
    <th>ID</th>
    <th>Name</th>
    <th>Email</th>
    <th>Role</th>
    <th>Actions</th>
  </tr>

  <%
    List<User> list = (List<User>) request.getAttribute("users");
    if (list != null) {
        for (User u : list) {
  %>
  <tr>
    <td><%= u.getUser_id() %></td>
    <td><%= u.getU_name() %></td>
    <td><%= u.getU_email() %></td>
    <td><%= u.getU_role() %></td>
    

    <td>
      <form action="UpdateUserRoleServlet" method="post" style="display:inline;">
        <input type="hidden" name="uid" value="<%= u.getUser_id() %>">
        <input type="hidden" name="newRole" value="<%= u.getU_role().equals("admin") ? "user" : "admin" %>">
        <button class="btn btn-role" type="submit">
          Change Role
        </button>
      </form>

      <form action="DeleteUserServlet" method="post" style="display:inline;">
        <input type="hidden" name="uid" value="<%= u.getUser_id() %>">
        <button class="btn btn-delete" type="submit" onclick="return confirm('Delete this user?');">
          Delete
        </button>
      </form>
    </td>
  </tr>
  <%
        }
    }
  %>

</table>

</body>
</html>
