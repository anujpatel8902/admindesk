<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>HR Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #ACB6E5 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background: white;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.2);
            text-align: center;
        }
        h2 {
            margin-bottom: 30px;
            color: #333;
        }
        form {
            display: inline-block;
            margin: 10px;
        }
        button {
            background: #4A90E2;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #357ABD;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, HR!</h2>
        <form action="/admin/add-employee" method="get">
            <button type="submit">Add Employee</button>
        </form>
        <form action="/admin/check-leave" method="get">
            <button type="submit">Check Leave</button>
        </form>
        <form action="/admin/apply-leave" method="get">
            <button type="submit">Apply for Leave</button>
        </form>
    </div>
</body>
</html>
