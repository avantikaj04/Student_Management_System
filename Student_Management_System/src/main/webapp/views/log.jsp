<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Login</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>

<body class="bg-primary-subtle">

<div class="container">
    <div class="row justify-content-center align-items-center vh-100">
        <div class="col-md-4">
            <div class="card shadow-lg rounded-4">
                <div class="card-body">

                    <h3 class="text-center mb-4">🔐 Admin Login</h3>

                    <!-- Error Message -->
                    <c:if test="${not empty login_fail}">
                        <div class="alert alert-danger text-center">
                            ${login_fail}
                        </div>
                    </c:if>

                    <form action="login" method="post">

                        <div class="mb-3">
                            <label class="form-label">Username</label>
                            <input type="text" name="username"
                                   class="form-control"
                                   placeholder="Enter username"
                                   required>
                        </div>

                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input type="password" name="password"
                                   class="form-control"
                                   placeholder="Enter password"
                                   required>
                        </div>

                        <div class="d-grid">
                            <button class="btn btn-primary">
                                Login
                            </button>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>
