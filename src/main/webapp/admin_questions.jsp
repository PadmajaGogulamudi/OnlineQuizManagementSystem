<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.model.Question" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Manage Questions - Admin</title>

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

        .btn-add {
            display: inline-block;
            margin-bottom: 15px;
            padding: 8px 14px;
            text-decoration: none;
            background: #0d6efd;
            color: white;
            border-radius: 5px;
            font-weight: bold;
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

        .btn-edit {
            background: #0b5ed7;
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

<a href="adminHome.jsp" class="back">← Back</a>

<h2>Manage Questions</h2>

<a href="add_question.jsp" class="btn-add">+ Add New Question</a>

<table>
    <tr>
        <th>ID</th>
        <th>Question</th>
        <th>Option A</th>
        <th>Option B</th>
        <th>Option C</th>
        <th>Option D</th>
        <th>Correct</th>
        
        <th>Actions</th>
    </tr>

    <%
        List<Question> qList = (List<Question>) request.getAttribute("questions");
        if (qList != null) {
            for (Question q : qList) {
    %>

    <tr>
        <td><%= q.getQ_id() %></td>
        <td><%= q.getQuestionText() %></td>
        <td><%= q.getOptionA() %></td>
        <td><%= q.getOptionB() %></td>
        <td><%= q.getOptionC() %></td>
        <td><%= q.getOptionD() %></td>
        <td><%= q.getCorrectOption() %></td>
       

        <td>
            <form action="EditQuestionServlet" method="get" style="display:inline;">
                <input type="hidden" name="qid" value="<%= q.getQ_id() %>">
                <button class="btn btn-edit" type="submit">Edit</button>
            </form>

            <form action="DeleteQuestionServlet" method="post" style="display:inline;">
                <input type="hidden" name="qid" value="<%= q.getQ_id() %>">
                <button class="btn btn-delete" onclick="return confirm('Delete this question?');">
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
