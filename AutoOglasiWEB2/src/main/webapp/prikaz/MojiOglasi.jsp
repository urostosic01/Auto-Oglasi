<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Moji oglasi</title>
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
	<h1 style="text-align: center;">MOJI OGLASI</h1>
	<div class="centriraj">
		<button><a href="/AutoOglasi/oglasi/generisiIzvestajOglasi">Generisi izvestaj</a></button>
	</div>
	<div class="kontejner">
		<c:forEach items="${mojiOglasi}" var="o">
			<div class="card">
				<h1>${o.automobil.proizvodjac.naziv} ${o.automobil.model.naziv}</h1><br>
				<p class="price">${o.cena}e</p>
				<p>${o.mesto}</p>
				<button><a href="/AutoOglasi/oglasi/detaljiOglas?idOglas=${o.idOglas}">Detalji</a></button>
				<button><a href="/AutoOglasi/oglasi/obrisiOglas?idOglas=${o.idOglas}">Obrisi</a></button>
			</div>
		</c:forEach>
	</div>
</body>
</html>