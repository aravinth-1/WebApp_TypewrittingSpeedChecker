<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String text = (String) request.getAttribute("displayText");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Typing Test</title>
    <script>
        let startTime;

        function startTimer() {
            startTime = new Date().getTime();
        }

        function calculateTime() {
            const endTime = new Date().getTime();
            return (endTime - startTime) / 1000; // seconds
        }

        function submitForm() {
            const timeTaken = calculateTime();
            document.getElementById("timeTaken").value = timeTaken;
            document.getElementById("typingForm").submit();
        }

        window.onload = function() {
            document.getElementById("userInput").focus();
        }
    </script>
</head>
<body>
    <h2>Type the following text:</h2>
    <p><strong><%= text %></strong></p>

    <form id="typingForm" action="result" method="post" onsubmit="submitForm(); return false;">
        <textarea name="userInput" id="userInput" rows="5" cols="60" onfocus="startTimer();"></textarea>
        <input type="hidden" name="timeTaken" id="timeTaken" value="">
        <br><br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>
