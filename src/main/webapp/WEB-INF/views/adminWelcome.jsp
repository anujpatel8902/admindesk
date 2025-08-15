<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${adminName} Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
        }
        .container {
            max-width: 400px;
            margin: 80px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.12);
            padding: 40px 32px 32px 32px;
            text-align: center;
        }
        h2 {
            color: #ff6f61;
            margin-bottom: 32px;
        }
        .action-btn {
            display: block;
            width: 100%;
            padding: 14px 0;
            margin: 16px 0;
            font-size: 1.1em;
            font-weight: 600;
            color: #fff;
            background: linear-gradient(90deg, #ff6f61 0%, #fda085 100%);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }
        .action-btn:hover {
            background: linear-gradient(90deg, #fda085 0%, #ff6f61 100%);
            transform: translateY(-2px) scale(1.03);
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
        <h2>Welcome, ${adminName}!</h2>
        <form action="/admin/addHR" method="get">
            <button type="submit" class="action-btn">Add HR</button>
        </form>
        <form action="/admin/check-leave" method="get">
            <button type="submit" class="action-btn">Check Leave</button>
        </form>
    </div>
</body>
</html>