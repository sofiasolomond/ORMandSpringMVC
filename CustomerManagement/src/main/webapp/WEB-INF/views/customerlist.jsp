<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8" content="">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>Customer Directory</title>
</head>
<body>
	<div class="container" align="center">
		<h3>Customer Directory</h3>
		<hr>
		<c:choose>
			<c:when test="${fn:length(Customer)>0}">
				<form action="/CustomerManagement/addcustomer"
					class="form-inline">
					<!-- Add a button -->
					<a href="/CustomerManagement/addcustomer"
						class="btn btn-primary btn-sm mb-3"> Add Customer </a>
				</form>
				<hr>
				<table
					class="table table-bordered table-striped table-hover table-condensed table-bordered">
					<thead class="thead-dark">
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>E Mail</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${Customer}" var="tempCustomer">
							<tr>
								<td><c:out value="${tempCustomer.firstName}" /></td>
								<td><c:out value="${tempCustomer.lastName}" /></td>
								<td><c:out value="${tempCustomer.eMail}" /></td>
								<td>
									<!-- Add "update" button/link --> <a
									href="/CustomerManagement/updatecustomer?customerid=${tempCustomer.customerId}"
									class="btn btn-info btn-sm"> Update </a> <!-- Add "delete" button/link -->
									<a
									href="/CustomerManagement/delete?customerid=${tempCustomer.customerId}"
									class="btn btn-danger btn-sm"
									onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
										Delete </a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:when>
			<c:otherwise>
				<div>
					<a href="/CustomerManagement/addcustomer"
						class="btn btn-primary btn-sm mb-3"> Add Customer </a>
				</div>
			</c:otherwise>

		</c:choose>

	</div>

</body>
</html>



