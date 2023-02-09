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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">

<style type="text/css">
.centriraj input[type=text], input[type=number] {
	background-color: transparent;
  	border: none;
 	border-bottom: 2px solid #333;
}
.centriraj{
	display: flex;
  	justify-content: center;
 }
.centriraj button {
	margin: 10px;
	background-color: #555555;
  	border: none;
  	color: white;
  	padding: 10px 22px;
  	text-align: center;
  	text-decoration: none;
  	font-size: 12px;
}
.centriraj button:hover {
	opacity: 0.7;
}
.centriraj select{
	background-color: #555555;
  	color: white;
  	padding: 12px;
  	border: none;
  	font-size: 15px;
  	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
  	-webkit-appearance: button;
  	appearance: button;
  	outline: none;
  	margin-bottom: 10px;
}
</style>
</head>
<body>
	
	<div class="topnav">
<%-- 		<img class="logo" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png">
 --%>  		<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
		<security:authorize access="isAuthenticated()">
			<a href="/AutoOglasi/admin/unosProizvodjaca">Nov proizvodjac</a>
			<a href="/AutoOglasi/admin/unosModela">Nov model</a>
			<a href="/AutoOglasi/oglasi/sviOglasi">Oglasi</a>
			<a href="/AutoOglasi/oglasi/unosAutomobila">Dodaj oglas</a>
			<a href="/AutoOglasi/oglasi/prikazSacuvani">Sacuvani</a>
			<a href="/AutoOglasi/oglasi/prikazPoruke">Poruke</a>
			<a href="/AutoOglasi/oglasi/mojiOglasi">Moji oglasi</a>
			<a style="float: right;" href="/AutoOglasi/auth/logout">Odjava</a>
		</security:authorize>
	</div>
	<h1 style="text-align: center;">Dodajte vase vozilo</h1>
	<br>
	<div class="centriraj">

		<form action="/AutoOglasi/oglasi/nadjiModele" method="get">
			<select name="idProizvodjac">
				<c:forEach items="${proizvodjaci}" var="p">
					<option value="${p.idProizvodjac}">${p.naziv}</option>
				</c:forEach>
			</select> 
			<button type="submit">Prikazi modele</button>
		</form>
		<br>
		<br>
	</div>
		<c:if test="${!empty modeliPoProizvodjacu}">
		<h3 style="text-align: center;">Modeli za : ${odabraniProizvodjac.naziv}</h3>
		
		<div class="centriraj">
		
		<form:form action="/AutoOglasi/oglasi/sacAutomobil" method="post" modelAttribute="automobil">
				<form:input type="hidden" value="${odabraniProizvodjac.idProizvodjac}" path="proizvodjac"/> 
		
				<form:select path="model" items="${modeliPoProizvodjacu}"
								itemValue="idModel" itemLabel="naziv" />
		
<!--  				<select name="idModel">
					<c:forEach items="${modeliPoProizvodjacu}" var="m">
						<option value="${m.idModel}">${m.naziv}</option>
					</c:forEach>
				</select>
				-->
				<br> 
				Godiste: <form:input type="number" path="godiste"/><br>
				Karoserija: <form:input type="text" path="karoserija"/><br> 
				Gorivo: <form:input type="text" path="gorivo"/><br>
				Opis: <form:input type="text" path="opis"/><br>
				Kubikaza: <form:input type="number" path="kubikaza"/><br> 
				Snaga: <form:input type="number" path="snaga"/><br> 
				<button type="submit">Dodaj vozilo</button>
			</form:form>
			</div>
		</c:if>
</body>
</html>