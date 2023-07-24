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
form {
	margin: auto auto;
	padding: 10px;
}

h3 {
	margin-top: 20px;
}
</style>


</head>
<body>
	<div class="container">

		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">

				<div class="collapse navbar-collapse" id="navbarNav">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page"
							href="${pageContext.request.contextPath}/showForm">Home</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/showForm">Add Person</a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/managePersons">Manage Persons</a></li>
							<li class="nav-item"><a class="nav-link"
						href="${pageContext.request.contextPath}/manageGroupes">Manage
							groupes </a></li>
						<li class="nav-item"><a class="nav-link"
							href="${pageContext.request.contextPath}/process">add groupe</a></li>

					</ul>
				</div>
			</div>
		</nav>






		<div>
			<h3>Registration Form</h3>
		</div>
		<div>

			<c:if test="${infoMsg!=null}">
				<div class="alert alert-success" role="alert">${infoMsg}</div>
			</c:if>
			<c:if test="${errorMsg!=null}">
				<div class="alert alert-danger" role="alert">${errorMsg}</div>
			</c:if>



			<f:form action="addPerson" method="POST" modelAttribute="personModel">


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
						<label>Personal Phone</label>
						<f:input path="personalnumphone" type="text"
							class="form-control" placeholder="Personal Number Phone" />
						<f:errors path="personalnumphone" class="text-danger" />
					</div>

					<div class="col">
						<label>Professional Phone</label>
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
							<label class="form-check-label">Female </label>
						</div>
						<div class="form-check">
							<f:radiobutton path="gender" class="form-check-input"
								value="male " />
							<label class="form-check-label">Male </label>
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