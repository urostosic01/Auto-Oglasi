<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unos proizvodjaca</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">

</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="main-container">
		<br>

		<div class="unos-proizvodjac-container">
			<h1 class="naslov">Dodaj novog proizvodjaca</h1>
			<form action="/AutoOglasi/admin/sacuvajProizvodjaca" method="post">
				<label for="naziv">Naziv: </label> <input id="naziv" type="text"
					name="naziv">
				<button type="submit">Dodaj</button>
			</form>
		</div>
		<c:if test="${!empty proizvodjac}">
			<h3 style="text-align: center;">Proizvodjac je uspesno dodat. Id
				je ${proizvodjac.idProizvodjac}</h3>
		</c:if>

		<br>
		<div class="unos-model-container">
			<h1 class="naslov">Dodaj novi model</h1>
			<form:form action="/AutoOglasi/admin/sacuvajModel" method="post"
				modelAttribute="model">
				<form:select path="proizvodjac" items="${proizvodjaci}"
					itemValue="idProizvodjac" itemLabel="naziv" class="select-minimal" />
			Naziv modela: <form:input type="text" path="naziv" />
				<button type="submit">Dodaj</button>
			</form:form>
		</div>
		<c:if test="${!empty modelNov}">
			<h3 style="text-align: center;">Model je uspesno dodat. Id je
				${modelNov.idModel}</h3>
		</c:if>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>

</body>
</html>