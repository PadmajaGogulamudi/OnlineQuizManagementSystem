<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.model.Question" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Quiz</title>
</head>
<body>
<%
    // Try request attribute first, fallback to session (safer)
    List<Question> qs = (List<Question>) request.getAttribute("questions");
    if (qs == null) {
        qs = (List<Question>) session.getAttribute("currentQuestions");
    }

    if (qs == null || qs.isEmpty()) {
%>
    <p>No questions found. Please go back to <a href="studentHome.jsp">Home</a> and try again.</p>
<%
    } else {
%>

<form method="post" action="<%= request.getContextPath() %>/SubmitQuizServlet">
<%
    for (Question q : qs) {
        // adjust getter names to match your Question class
        // I assume getters: getQId(), getQuestionText(), getOptionA(), ...
        int id = q.getQ_id();          // if your getter is getQ_id(), change accordingly
        String qtext = q.getQuestionText();
        String a = q.getOptionA();
        String b = q.getOptionB();
        String c = q.getOptionC();
        String d = q.getOptionD();
%>
  <div style="margin-bottom:16px;">
    <p><b><%= qtext %></b></p>
    <label><input type="radio" name="q_<%= id %>" value="A"> <%= a %></label><br/>
    <label><input type="radio" name="q_<%= id %>" value="B"> <%= b %></label><br/>
    <label><input type="radio" name="q_<%= id %>" value="C"> <%= c %></label><br/>
    <label><input type="radio" name="q_<%= id %>" value="D"> <%= d %></label><br/>
  </div>
<%
    } // end for
%>
  <button type="submit">Submit</button>
</form>

<%
    } // end else
%>
</body>
</html>
