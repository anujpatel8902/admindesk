<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Employee</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            min-height: 100vh;
            margin: 0;
            background: linear-gradient(135deg, #ffecd2 0%, #fcb69f 100%);
            display: flex;
            align-items: center;
            justify-content: center;
            overflow-x: hidden;
            animation: gradientMove 10s ease infinite alternate;
        }

        @keyframes gradientMove {
            from { background-position: left; }
            to { background-position: right; }
        }

        .form-card {
            background: rgba(255, 255, 255, 0.28);
            border-radius: 20px;
            box-shadow: 0 8px 32px rgba(31, 38, 135, 0.2);
            padding: 30px 24px 24px 24px;
            width: 330px;
            text-align: center;
            backdrop-filter: blur(12px);
            border: 1px solid rgba(255,255,255,0.3);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .form-card:hover {
            transform: translateY(-4px) scale(1.02);
            box-shadow: 0 12px 28px rgba(31,38,135,0.25);
        }

        h2 {
            color: #d35400;
            margin-bottom: 22px;
            text-shadow: 1px 1px #ffffff80;
        }

        .form-field {
            width: 100%;
            padding: 11px 9px;
            margin: 8px 0 14px 0;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 1rem;
            background: rgba(255, 255, 255, 0.85);
            transition: border 0.2s, box-shadow 0.2s;
        }

        .form-field:focus {
            border: 1.5px solid #f6a700;
            outline: none;
            box-shadow: 0 0 0 3px rgba(246,167,0,0.2);
            background: #fffbe7;
        }

        .custom-btn {
            background: linear-gradient(90deg, #ff7300 0%, #f6a700 100%);
            color: #fff;
            border: none;
            border-radius: 10px;
            padding: 14px 32px;
            font-size: 1.08rem;
            margin-top: 12px;
            cursor: pointer;
            transition: background 0.2s, box-shadow 0.2s, transform 0.1s;
            box-shadow: 0 4px 12px rgba(246,167,0,0.15);
            font-weight: 600;
        }

        .custom-btn:hover {
            background: linear-gradient(90deg, #d35400 0%, #f6a700 100%);
            box-shadow: 0 6px 20px rgba(246,167,0,0.25);
            transform: translateY(-2px) scale(1.04);
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 4px;
            color: #b05d00;
            font-weight: 500;
        }

        option {
            background: #fff;
        }

        @media screen and (max-width: 400px) {
            .form-card {
                width: 90%;
                padding: 24px 16px;
            }
        }
    </style>
</head>
<body>

    <div class="form-card">
        <h2>Add HR</h2>
        <form id="addHRForm" action="${pageContext.request.contextPath}/admin/saveHR" method="post">
            <label for="name">Name:</label>
            <input class="form-field" type="text" name="name" id="name" required />

            <label for="email">Email:</label>
            <input class="form-field" type="email" name="email" id="email" required />

            <label for="password">Password:</label>
            <input class="form-field" type="password" name="password" id="password" required />

            <label for="dob">DOB:</label>
            <input class="form-field" type="date" name="dob" id="dob" required />

            <label for="designation">Designation:</label>
            <select class="form-field" name="designation" id="designation" required>
                <option value="HR">HR</option>
            </select>

            <label for="joiningDate">Joining Date:</label>
            <input class="form-field" type="date" name="joiningDate" id="joiningDate" required />

            <button type="submit" class="custom-btn">Save</button>
        </form>
    </div>
    <script>
    document.getElementById('addHRForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const form = e.target;
        const data = new FormData(form);
        fetch(form.action, {
            method: 'POST',
            body: data
        })
        .then(response => response.json())
        .then(result => {
            if(result.success) {
                alert(result.success);
                form.reset();
            } else if(result.error) {
                alert(result.error);
            }
        })
        .catch(() => alert('Something went wrong!'));
    });
    </script>
</body>
</html>
