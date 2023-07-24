<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib prefix="f" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<title>Update form</title>
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
	margin: 0;
	padding: 0;
}

form {
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



					<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/managePersons">Manage Persons </a></li>

					<li class="nav-item">
						<form action="${pageContext.request.contextPath}/searchPerson"
							method="POST" class="d-flex search-form">
							<select name="searchCriteria" class="form-select search-criteria">
								<option value="lastName">Last Name</option>
								<option value="professionalnumphone">Professional Number Phone</option>
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
			<h3>Update Person</h3>
		</div>
		<div>



			<f:form action="${pageContext.request.contextPath}/updatePerson"
				method="POST" modelAttribute="personModel">
				<f:hidden path="idPersonne"/>

				<div class="row">

					<div class="col">
						<label>First Name</label>
						<f:input path="firstName" type="text" class="form-control"
							placeholder="First Name" />
						<f:errors path="firstName" class="text-danger" />
					</div>

					<div class="col">
						<label>Last Name</label>
						<f:input path="lastName" type="text" class="form-control"
							placeholder="Last Name" />
						<f:errors path="lastName" class="text-danger" />
					</div>
				</div>


				<div class="row">
					<div class="col">
						<label>Personal Number Phone</label>
						<f:input path="personalnumphone" type="text" class="form-control"
							placeholder="Personal Number Phone" />
						<f:errors path="personalnumphone" class="text-danger" />
					</div>

					<div class="col">
						<label>Professional Number Phone</label>
						<f:input path="professionalnumphone" type="text"
							class="form-control" placeholder="Professional Number Phone" />
						<f:errors path="professionalnumphone" class="text-danger" />
					</div>
				</div>

				<div class="row">
					<div class="col">
						<label>Personal Email</label>
						<f:input path="personalemail" class="form-control"
							placeholder="Personal Email" />
						<f:errors path="personalemail" class="text-danger" />
					</div>

					<div class="col">
						<label>Professional Email</label>
						<f:input path="professionalemail" class="form-control"
							placeholder="Professional Email" />
						<f:errors path="professionalemail" class="text-danger" />
					</div>
				</div>

				<div class="row">
					<div class="col">
						<label>Address</label>
						<f:input path="address" type="text" class="form-control"
							placeholder="...., Morocco" />
						<f:errors path="address" class="text-danger" />
					</div>



					<div class="col">
						<legend class="col-form-label col-sm-2 pt-0">Gender</legend>
						<div class="form-check">
							<f:radiobutton path="gender" class="form-check-input"
								value="female" />
							<label class="form-check-label">Female</label>
						</div>
						<div class="form-check">
							<f:radiobutton path="gender" class="form-check-input"
								value="male " />
							<label class="form-check-label">Male</label>
						</div>
						<f:errors path="gender" class="text-danger" />

					</div>
				</div>

				<div style="text-align: right">
					<button type="submit" class="btn btn-primary">Register</button>
					<button type="reset" class="btn btn-secondary">Rest</button>
				</div>

			</f:form>
		</div>


	</div>
</body>
</html>