<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unos proizvodjaca</title>
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
	<h1 style="text-align: center;">Novi proizvodjac:</h1><br>
	
	<div class="centriraj">
	<form action="/AutoOglasi/oglasi/sacuvajProizvodjaca" method="post">
		Naziv: <input type="text" name="naziv">
		<button type="submit">Dodaj</button>
	</form>
	</div>
	<c:if test="${!empty proizvodjac}">
		<h3 style="text-align: center;">Proizvodjac je uspesno dodat. Id je ${proizvodjac.idProizvodjac}</h3>
	</c:if>
	
</body>
</html>