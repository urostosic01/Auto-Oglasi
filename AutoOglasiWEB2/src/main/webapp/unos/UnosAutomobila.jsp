<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unos automobila</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>

	<jsp:include page="/template/header.jsp"></jsp:include>

	<h1 style="text-align: center;">Dodajte vase vozilo</h1>
	<br>
	<div class="">

		<form action="/AutoOglasi/oglasi/nadjiModele" method="get">
			<select name="idProizvodjac" class="select-minimal">
				<c:forEach items="${proizvodjaci}" var="p">
					<option value="${p.idProizvodjac}">${p.naziv}</option>
				</c:forEach>
			</select>
			<button type="submit">Prikazi modele</button>
		</form>
		<br> <br>
	</div>
	<c:if test="${!empty modeliPoProizvodjacu}">
		<h3 style="text-align: center;">Modeli za :
			${odabraniProizvodjac.naziv}</h3>

		<div class="">

			<form:form action="/AutoOglasi/oglasi/sacAutomobil" method="post"
				modelAttribute="automobil">
				<form:input type="hidden"
					value="${odabraniProizvodjac.idProizvodjac}" path="proizvodjac" />

				<form:select path="model" items="${modeliPoProizvodjacu}"
					itemValue="idModel" itemLabel="naziv" class="select-minimal"/>
				<br> 
				Godiste: <form:input type="number" path="godiste" />
				<br>
				Karoserija: <form:input type="text" path="karoserija" />
				<br> 
				Gorivo: <form:input type="text" path="gorivo" />
				<br>
				Opis: <form:input type="text" path="opis" />
				<br>
				Kubikaza: <form:input type="number" path="kubikaza" />
				<br> 
				Snaga: <form:input type="number" path="snaga" />
				<br>
				<button type="submit">Dodaj vozilo</button>
			</form:form>
		</div>
	</c:if>
</body>
</html>