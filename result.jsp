<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Integer wpm = (Integer) request.getAttribute("wpm");
    Double accuracy = (Double) request.getAttribute("accuracy");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Typing Test Results</title>
</head>
<body>
    <h2>Typing Results</h2>
    <p><strong>Words Per Minute (WPM):</strong> <%= wpm %></p>
    <p><strong>Accuracy:</strong> <%= accuracy %> %</p>

    <br>
    <a href="start.jsp">Try Again</a>
</body>
</html>
