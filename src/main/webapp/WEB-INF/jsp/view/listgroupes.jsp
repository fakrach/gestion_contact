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

					<li class="nav-item"><form
							action="${pageContext.request.contextPath}/searchGroupe"
							class="d-flex" method="POST">
							<input name="nom" class="form-control me-2" type="search"
								placeholder="chercher un groupe" aria-label="Search">
							<button class="btn btn-outline-success" type="submit">Search</button></li>

				</ul>



			</div>

		</nav>



		<div>
			<h3>List of groupes</h3>
		</div>

		<div>

			<table class="table table-hover th-lg">
				<thead>
					<tr>
						<th scope="col">Name of groupe</th>
						<th scope="col">Action</th>

					</tr>
				</thead>
				<c:forEach items="${Groupelist}" var="p">
					<tr>
						<td><c:out value="${p.groupeName}" /></td>


						<td>
						
								<a href="deleteGroupe/${p.idGroupe}"><button class="btn bg-danger">Delete</button></a>

								<a href="updateGroupeForm/${p.idGroupe}"><button class="btn btn-primary">Add</button></a>
						
						</td>

					</tr>

				</c:forEach>

			</table>
		</div>
	</div>
</body>
</html>