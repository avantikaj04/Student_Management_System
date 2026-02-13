<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Management</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css"
	rel="stylesheet">

<style>
body {
	background: #f5f7fb;
	font-family: 'Segoe UI', sans-serif;
}

/* Navbar */
nav {
	background: rgba(255, 255, 255, 0.95);
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

/* Enrollment Section */
.enroll {
	background: linear-gradient(rgba(0, 0, 0, 0.55),
		rgba(0, 0, 0, 0.55)), url("images/stud1.png");
	background-size: cover;
	background-position: center;
}

/* View Section */
.view {
	background: linear-gradient(rgba(255, 255, 255, 0.95),
		rgba(255, 255, 255, 0.95)), url("images/savestudent.jpg");
	background-size: cover;
	background-position: center;
	padding: 30px;
}

/* Cards */
.card-registration {
	background: white;
	border-radius: 15px;
	box-shadow: 0 12px 30px rgba(0, 0, 0, 0.25);
}

/* Headings */
.heading {
	color: #0d6efd;
	font-weight: 700;
	text-align: center;
	margin-bottom: 15px;
}

/* Inputs */
.form-control-sm, .select {
	border-radius: 8px;
}

/* Buttons */
.btn {
	border-radius: 25px;
	padding: 6px 18px;
}

/* Table */
table {
	background: white;
	border-radius: 12px;
	overflow: hidden;
	box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15);
}

thead {
	background: #0d6efd;
	color: white;
}

.pagination .page-link {
	border-radius: 50%;
	margin: 0 5px;
}
</style>
</head>

<body>

<div class="card">

	<!-- NAVBAR -->
	<nav class="d-flex justify-content-between align-items-center px-4 py-2">
		<img src="images/cjc1.png" width="120" height="55">
		<div>
			<a href="#enroll" class="btn btn-outline-primary me-2">Enroll Student</a>
			<a href="#view" class="btn btn-outline-success me-2">View Student</a>
			<a href="/" class="btn btn-outline-danger">Logout</a>
		</div>
	</nav>

	<!-- ENROLL SECTION -->
	<section class="enroll vh-100 d-flex align-items-center" id="enroll">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-8 col-lg-6">
					<div class="card card-registration p-4">
						<h3 class="heading">Student Enrollment</h3>

						<form action="enroll_student">

							<div class="row">
								<div class="col-md-6 mb-2">
									<input type="text" class="form-control form-control-sm"
										name="studentFullName" placeholder="Full Name">
								</div>

								<div class="col-md-6 mb-2">
									<input type="email" class="form-control form-control-sm"
										name="studentEmail" placeholder="Email">
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 mb-2">
									<input type="number" class="form-control form-control-sm"
										name="studentAge" placeholder="Age">
								</div>

								<div class="col-md-6 mb-2">
									<input type="text" class="form-control form-control-sm"
										name="studentCollageName" placeholder="College Name">
								</div>
							</div>

							<div class="row">
								<div class="col-md-6 mb-2">
									<input type="number" class="form-control form-control-sm"
										name="feesPaid" placeholder="Fees Paid">
								</div>

								<div class="col-md-6 mb-2">
									<label class="fw-bold">Course</label><br>
									<input type="radio" name="studentCourse" value="Java" checked> Java
									<input type="radio" name="studentCourse" value="Python" class="ms-2"> Python
									<input type="radio" name="studentCourse" value="Testing" class="ms-2"> Testing
								</div>
							</div>

							<div class="row mb-3">
								<div class="col">
									<select class="form-control form-control-sm" name="batchMode">
										<option disabled selected>Batch Mode</option>
										<option>Online</option>
										<option>Offline</option>
									</select>
								</div>

								<div class="col">
									<select class="form-control form-control-sm" name="batchNumber">
										<option disabled selected>Batch Number</option>
										<option>FDJ-160</option>
										<option>REG-199</option>
										<option>FDJ-199</option>
										<option>REG-162</option>
									</select>
								</div>
							</div>

							<div class="text-center">
								<input type="submit" value="Enroll Student"
									class="btn btn-primary btn-lg">
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- VIEW SECTION -->
	<section class="view" id="view">
		<div class="card p-4">

			<h3 class="heading">View Students</h3>

			<form action="search" method="get" class="d-flex gap-2 mb-3">
				<select class="form-control form-control-sm border-primary"
					name="batchNumber">
					<option disabled selected>Select Batch</option>
					<option>FDJ-160</option>
					<option>REG-199</option>
					<option>FDJ-199</option>
					<option>REG-162</option>
				</select>
				<button class="btn btn-outline-primary">Search</button>
			</form>

			<h5 class="text-danger text-center">${message}</h5>

			<table class="table table-hover table-sm text-center">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Email</th>
						<th>Age</th>
						<th>College</th>
						<th>Course</th>
						<th>Batch</th>
						<th>Mode</th>
						<th>Fees</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${data}" var="s">
						<tr>
							<td>${s.studentID}</td>
							<td>${s.studentFullName}</td>
							<td>${s.studentEmail}</td>
							<td>${s.studentAge}</td>
							<td>${s.studentCollageName}</td>
							<td>${s.studentCourse}</td>
							<td>${s.batchNumber}</td>
							<td>${s.batchMode}</td>
							<td>${s.feesPaid}</td>
							<td>
								<a class="btn btn-sm btn-success"
									href="fees?id=${s.studentID}">Fees</a>
								<a class="btn btn-sm btn-primary"
									href="shift?id=${s.studentID}">Shift</a>
								<a class="btn btn-sm btn-danger"
									href="delete?id=${s.studentID}">Delete</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav class="mt-3">
				<ul class="pagination justify-content-center pagination-lg">
					<li class="page-item active"><a class="page-link"
						href="pagging?pageno=0">1</a></li>
					<li class="page-item"><a class="page-link"
						href="pagging?pageno=1">2</a></li>
					<li class="page-item"><a class="page-link"
						href="pagging?pageno=2">3</a></li>
				</ul>
			</nav>

		</div>
	</section>

</div>

</body>
</html>
