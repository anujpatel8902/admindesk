<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = (String) request.getAttribute("role");
    String name = (String) request.getAttribute("name");
    String welcomeMsg = "Welcome";
    if (name != null && !name.isEmpty()) {
        welcomeMsg = "Welcome, " + name + "!";
    } else if (role != null) {
        welcomeMsg = "Welcome " + role + "!";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #a8edea 0%, #fed6e3 100%);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            background: rgba(255,255,255,0.85);
            border-radius: 18px;
            box-shadow: 0 8px 32px 0 rgba(31,38,135,0.25);
            padding: 40px 32px 32px 32px;
            width: 370px;
            text-align: center;
            backdrop-filter: blur(4px);
        }
        h2 {
            color: #2d3a4b;
            margin-bottom: 18px;
        }
        .custom-btn {
            background: linear-gradient(90deg, #2563eb 0%, #13c1ac 100%);
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 14px 32px;
            font-size: 1.1rem;
            margin: 18px 0 0 0;
            cursor: pointer;
            transition: background 0.2s, box-shadow 0.2s, transform 0.1s;
            box-shadow: 0 2px 8px rgba(37,99,235,0.10);
            font-weight: 600;
        }
        .custom-btn:hover {
            background: linear-gradient(90deg, #1e40af 0%, #0e9488 100%);
            box-shadow: 0 4px 18px rgba(37,99,235,0.18);
            transform: translateY(-2px) scale(1.04);
        }
        form {
            margin-bottom: 14px;
        }
        .welcome-msg {
            color: #444;
            font-size: 1.05rem;
            margin-bottom: 18px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2><%= welcomeMsg %></h2>
        <% if (name != null && !name.isEmpty()) { %>
            <p>You have successfully logged in as <b><%= name %></b> (Admin).</p>
        <% } else if (role != null) { %>
            <p>You have successfully logged in as <b><%= role %></b>.</p>
        <% } else { %>
            <p>You have successfully logged in.</p>
        <% } %>
        <form action="${pageContext.request.contextPath}/admin/addEmployee" method="get">
            <button type="submit" class="custom-btn">Add Employee</button>
        </form>
        <form action="${pageContext.request.contextPath}/admin/checkLeave" method="get">
            <button type="submit" class="custom-btn">Check Leave</button>
        </form>
    </div>
</body>
</html>