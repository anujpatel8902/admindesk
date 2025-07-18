<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Manager Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
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
            background: #F2994A;
            color: white;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }
        button:hover {
            background: #D97A2F;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Welcome, Manager!</h2>
        <form action="/admin/view-employees" method="get">
            <button type="submit">View Employees</button>
        </form>
        <form action="/admin/approve-leave" method="get">
            <button type="submit">Approve Leave</button>
        </form>
        <form action="/admin/reports" method="get">
            <button type="submit">View Reports</button>
        </form>
    </div>
</body>
</html>
