<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>registration form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<style>
h3 {
	margin-top: 20px;
}

#navbarNav div {
	height: 0;
}

#navbarNav form {
	margin-bottom: 0px;
	margin-top: 0px;
	padding: 10px;
}

a{
	text-decoration: none;
}
</style>


</head>
<body>
	<div class="container">



		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page"
						href="${pageContext.request.contextPath}/showForm">Home</a></li>





					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/showForm">Add Persons
					</a></li>


					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/managePersons">Manage
							Persons </a></li>

					<li class="nav-item">
						<form action="${pageContext.request.contextPath}/searchPerson"
							method="POST" class="d-flex search-form">
							<select name="searchCriteria" class="form-select search-criteria">
								<option value="lastName">Last Name</option>
								<option value="professionalnumphone">Professional
									Number Phone</option>
								<option value="personalnumphone">Personal Number Phone</option>
							</select> <input name="searchTerm" class="form-control me-2 search-input"
								type="search" placeholder="Search term" aria-label="Search">
							<button class="btn btn-outline-success search-button"
								type="submit">Search</button>
						</form>
					</li>

				</ul>



			</div>

		</nav>



		<div>
			<h3>List of Persons</h3>
		</div>

		<div>

			<table class="table table-hover">
				<thead>
					<tr>
						<th scope="col">first Name</th>
						<th scope="col">lastName</th>
						<th scope="col">personal number phone</th>
						<th scope="col">professional number phone</th>
						<th scope="col">address</th>
						<th scope="col">personal email</th>
						<th scope="col">professional email</th>
						<th scope="col">gender</th>
						<th scope="col">Action</th>
					</tr>
				</thead>
				<c:forEach items="${personList}" var="p">
					<tr>
						<td><c:out value="${p.firstName}" /></td>
						<td><c:out value="${p.lastName}" /></td>
						<td><c:out value="${p.personalnumphone}" /></td>
						<td><c:out value="${p.professionalnumphone}" /></td>
						<td><c:out value="${p.address}" /></td>
						<td><c:out value="${p.personalemail}" /></td>
						<td><c:out value="${p.professionalemail}" /></td>
						<td><c:out value="${p.gender}" /></td>

						<td>
							
								<a href="deletePerson/${p.idPersonne}"><button class="btn bg-danger">Delete</button></a>

								<a href="updatePerson/${p.idPersonne}"><button class="btn btn-primary">Update</button></a>
							
						</td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>