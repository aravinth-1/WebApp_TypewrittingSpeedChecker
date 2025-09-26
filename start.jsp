<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Typing Speed Test</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            text-align: center;
            padding: 80px;
            background: linear-gradient(to right, #f0f2f5, #e2e8f0);
        }
        h1 {
            color: #2c3e50;
        }
        button {
            padding: 12px 30px;
            font-size: 18px;
            background-color: #3498db;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 20px;
        }
        button:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <h1>Welcome to the Typing Speed Tester</h1>
    <p>Click the button below to begin your typing speed test.</p>
    
    <form action="start" method="get">
        <button type="submit">Start Test</button>
    </form>
</body>
</html>
