<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Admin Welcome</title>
</head>
<body>
    <h2>Welcome, Admin!</h2>
    <form action="/admin/manage-users" method="get" style="display:inline;">
        <button type="submit">Manage Users</button>
    </form>
    <form action="/admin/system-settings" method="get" style="display:inline;">
        <button type="submit">System Settings</button>
    </form>
    <form action="/admin/backup" method="get" style="display:inline;">
        <button type="submit">Backup System</button>
    </form>
</body>
</html>