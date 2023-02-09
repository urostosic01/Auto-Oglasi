<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unos modela</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">

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
	<h1 style="text-align: center;">Novi model:</h1>
	<br>
	<div class="centriraj">
		<form:form action="/AutoOglasi/oglasi/sacuvajModel" method="post"
			modelAttribute="model">
			<form:select path="proizvodjac" items="${proizvodjaci}" itemValue="idProizvodjac" itemLabel="naziv" />
			Naziv modela: <form:input type="text" path="naziv"/>
			<button type="submit">Dodaj</button>
		</form:form>
	</div>
	<c:if test="${!empty modelNov}">
		<h3 style="text-align: center;">Model je uspesno dodat. Id je ${modelNov.idModel}</h3>
	</c:if>
	
</body>
</html>