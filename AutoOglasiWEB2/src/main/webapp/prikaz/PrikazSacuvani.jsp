<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Omiljeni</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
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
	<h1 style="text-align: center;">SACUVANI OGLASI</h1>
	<div class="centriraj">
	<button><a href="/AutoOglasi/oglasi/generisiIzvestajSacuvani">Generisi izvestaj</a></button>
	</div>
	<div class="kontejner">
		<c:forEach items="${sacuvani}" var="s">
			<div class="card">
				<h1>${s.ogla.automobil.proizvodjac.naziv} ${s.ogla.automobil.model.naziv}</h1><br>
				<p class="price">${s.ogla.cena}e</p>
				<p>${s.ogla.mesto}</p>
				<button><a href="/AutoOglasi/oglasi/detaljiOglas?idOglas=${s.ogla.idOglas}">Detalji</a></button>
			</div>
		</c:forEach>
	</div>
</body>
</html>