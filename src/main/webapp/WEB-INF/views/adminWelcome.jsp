<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: rgba(255, 255, 255, 0.85);
            border-radius: 18px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.18);
            padding: 40px 36px 32px 36px;
            width: 350px;
            text-align: center;
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255,255,255,0.3);
        }
        h2 {
            color: #d35400;
            margin-bottom: 32px;
            font-size: 2rem;
            letter-spacing: 1px;
            text-shadow: 1px 1px #ffffff80;
        }
        .action-btn {
            background: linear-gradient(90deg, #ff7300 0%, #f6a700 100%);
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 16px 36px;
            font-size: 1.1rem;
            margin: 16px 0 0 0;
            cursor: pointer;
            transition: background 0.2s, box-shadow 0.2s, transform 0.1s;
            box-shadow: 0 4px 12px rgba(246,167,0,0.15);
            font-weight: 600;
            width: 100%;
        }
        .action-btn:hover {
            background: linear-gradient(90deg, #d35400 0%, #f6a700 100%);
            box-shadow: 0 6px 20px rgba(246,167,0,0.25);
            transform: translateY(-2px) scale(1.04);
        }
        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 18px;
            margin-top: 18px;
        }
        @media screen and (max-width: 500px) {
            .card {
                width: 95%;
                padding: 24px 8px;
            }
            h2 {
                font-size: 1.3rem;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Welcome, Admin!</h2>
        <div class="btn-group">
            <form action="/admin/addHR" method="get">
                <button type="submit" class="action-btn">Add HR</button>
            </form>
            <form action="/admin/approve-leave" method="get">
                <button type="submit" class="action-btn">Approve Leave</button>
            </form>
        </div>
    </div>
</body>
</html>