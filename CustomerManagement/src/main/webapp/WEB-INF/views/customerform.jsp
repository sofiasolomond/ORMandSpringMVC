<%@page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- Required meta tags -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<title>Customer Details</title>
</head>
<body>
	<div class="container">
		<h3>Customer Details</h3>
		<hr>
		<p class="h5 mb-5">Add/Modify Customer Information</p>
		<form action="/CustomerManagement/save" method="POST">
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="customerid" value="${Customer.customerId}" />
			<div class="form-inline">
				<input type="text" name="firstname" value="${Customer.firstName}"
					class="form-control mb-4 col-4" placeholder="First Name">
			</div>
			<div class="form-inline">
				<input type="text" name="lastname" value="${Customer.lastName}"
					class="form-control mb-4 col-4" placeholder="Second Name">
			</div>
			<div class="form-inline">
				<input type="text" name="email" value="${Customer.eMail}"
					class="form-control mb-4 col-4" placeholder="E-Mail">
			</div>

			<button type="submit" class="btn btn-info col-2">Save</button>
		</form>
		<hr>
		<a href="/CustomerManagement/list">Back to Customer</a>

	</div>
</body>

</html>