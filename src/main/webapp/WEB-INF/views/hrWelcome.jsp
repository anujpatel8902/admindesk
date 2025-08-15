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
        .logout-container {
            position: absolute;
            top: 20px;
            right: 20px;
        }
        .logout-btn {
            background: #f44336;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="logout-container">
        <form action="/admin/logout" method="get">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </div>
    <div class="container">
        <h2>Welcome, HR!</h2>
        <form action="/hr/add-employee" method="get">
            <button type="submit">Add Employee</button>
        </form>
        <form action="/hr/add-manager" method="get">
                    <button type="submit">Add Manager</button>
         </form>
        <form action="/hr/check-leave" method="get">
            <button type="submit">Check Leave</button>
        </form>
        <form action="/hr/apply-leave" method="get">
            <button type="submit">Apply for Leave</button>
        </form>
    </div>
</body>
</html>
