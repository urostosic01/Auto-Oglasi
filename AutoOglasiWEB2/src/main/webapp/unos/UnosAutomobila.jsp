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
	<div class="main-container">
		<br>
		<div class="unos-automobila-container">
			<h1 class="naslov">Dodajte vase vozilo</h1>
			<div class="center">
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
		</div>
		<c:if test="${!empty modeliPoProizvodjacu}">

			<div class="unos-automobila-container">
			<h2 class="naslov">Modeli za :
				${odabraniProizvodjac.naziv}</h2>

				<form:form action="/AutoOglasi/oglasi/sacAutomobil" method="post"
					modelAttribute="automobil">
					<div class="center">
					<table>
						<tr>
							<td>Model: </td>
							<td><form:input type="hidden" value="${odabraniProizvodjac.idProizvodjac}" path="proizvodjac" />
								<form:select path="model" items="${modeliPoProizvodjacu}" itemValue="idModel" 
											itemLabel="naziv" class="select-minimal" /></td>
						</tr>
						<tr>
							<td>Godiste: </td>
							<td><form:input type="number" path="godiste" /></td>
						</tr>
						<tr>
							<td>Karoserija: </td>
							<td><form:input type="text" path="karoserija" /></td>
						</tr>
						<tr>
							<td>Gorivo: </td>
							<td><form:input type="text" path="gorivo" /></td>
						</tr>
						<tr>
							<td>Opis: </td>
							<td><form:input type="text" path="opis" /></td>
						</tr>
						<tr>
							<td>Kubikaza: </td>
							<td><form:input type="number" path="kubikaza" /></td>
						</tr>
						<tr>
							<td>Snaga (kW): </td>
							<td><form:input type="number" path="snaga" /></td>
						</tr>
					</table>
						<div style="text-align: center;"><button type="submit">Dodaj vozilo</button></div>
					</div>
				</form:form>
			</div>
		</c:if>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>



</body>
</html>