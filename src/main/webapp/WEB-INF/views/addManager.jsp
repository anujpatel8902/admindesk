<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Manager</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .container {
            max-width: 500px;
            width: 90%;
            margin: 20px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.12);
            padding: 40px 32px;
            text-align: center;
        }
        h2 {
            color: #ff6f61;
            margin-bottom: 32px;
        }
        .form-group {
            margin-bottom: 20px;
            text-align: left;
        }
        label {
            display: block;
            margin-bottom: 8px;
            color: #555;
            font-weight: 600;
        }
        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"],
        select {
            width: calc(100% - 20px);
            padding: 12px 10px;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1em;
            box-sizing: border-box;
        }
        button {
            display: block;
            width: 100%;
            padding: 14px 0;
            margin-top: 20px;
            font-size: 1.1em;
            font-weight: 600;
            color: #fff;
            background: linear-gradient(90deg, #ff6f61 0%, #fda085 100%);
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }
        button:hover {
            background: linear-gradient(90deg, #fda085 0%, #ff6f61 100%);
            transform: translateY(-2px) scale(1.03);
        }
        .message {
            margin-top: 20px;
            padding: 10px;
            border-radius: 5px;
            font-weight: bold;
        }
        .success {
            color: #28a745;
            background-color: #d4edda;
            border-color: #c3e6cb;
        }
        .error {
            color: #dc3545;
            background-color: #f8d7da;
            border-color: #f5c6cb;
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
    <h2>Add New Manager</h2>

    <%-- Display success or error messages --%>
    <% if (request.getAttribute("success") != null) { %>
    <div class="message success"><%= request.getAttribute("success") %></div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
    <div class="message error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="/hr/add-manager-data" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob" required>
        </div>
        <div class="form-group">
            <label for="joiningDate">Joining Date:</label>
            <input type="date" id="joiningDate" name="joiningDate" required>
        </div>
        <button type="submit">Add Manager</button>
    </form>
</div>
</body>
</html>
