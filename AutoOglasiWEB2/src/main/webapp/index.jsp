<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pocetna</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
<div class="topnav">
<%-- 		<img class="logo" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png">
 --%>  		<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
 			<a href="/AutoOglasi/auth/loginPage">Login</a> 
 			<a href="/AutoOglasi/gost/sviOglasi">Oglasi</a>
 			
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
	
	<h1 style="text-align: center;">OGLASI</h1>
	<img src="${pageContext.request.contextPath}/img/logo_transparent.png" class="center" style="height: 200px; width: 200px; "/>
	
	<div class="kontejner">
		<c:forEach items="${oglasi}" var="o">
			<div class="card">
				<h1>${o.automobil.proizvodjac.naziv} ${o.automobil.model.naziv}</h1><br>
				<p class="price">${o.cena}e</p>
				<p>${o.mesto}</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>