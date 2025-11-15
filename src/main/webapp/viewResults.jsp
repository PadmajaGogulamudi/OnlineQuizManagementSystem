<%@ page import="java.util.List, com.model.Result" %>
<%
  List<Result> results = (List<Result>) request.getAttribute("results");
%>
<!DOCTYPE html>
<html><head><meta charset="utf-8"><title>My Results</title></head>
<body>
  <h2>My Results</h2>
  <table border="1" cellpadding="6">
    <tr><th>Attempted At</th><th>Score</th><th>Total</th></tr>
    <% for (Result r : results) { %>
      <tr>
        <td><%= r.getAttemptedAt() %></td>
        <td><%= r.getScore() %></td>
        <td><%= r.getTotalMarks() %></td>
      </tr>
    <% } %>
  </table>
  <p><a href="studentHome.jsp">Back to Home</a></p>
</body></html>
