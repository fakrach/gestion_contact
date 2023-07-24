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
					
					<f:form action="${pageContext.request.contextPath}/updateGroupe" method="POST" modelAttribute="thisgroupe">
							<input type="hidden" name="groupid" value="${thisgroupe.idGroupe}" />
							<div class="row">
								<div class="col">
									<label><h3>Selectionnez les personnes que vous souhaitez ajouter au groupe : ${thisgroupe.groupeName}</h3></label><br>
					
									<c:forEach items="${PersonList}" var="contact">
										<input type="checkbox" name="contactIds" path="contact" value="${contact.idPersonne}" onclick="toggleAjouterBtn()" />
										${contact.lastName} ${contact.firstName}<br>
									</c:forEach><br>
					
									<div style="text-align: right">
					                     <button type="submit" class="btn btn-primary">Register</button>
				                     	<button type="reset" class="btn btn-secondary">Rest</button>
				                    </div>
								</div>
							</div>
					</f:form>

		
	
</body>
</html>