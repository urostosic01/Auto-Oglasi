<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Unos oglasa</title>
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

	<h3 style="text-align: center;">Uspesno dodat:</h3>
	<h4 style="text-align: center;">${novAuto.proizvodjac.naziv} ${novAuto.model.naziv} (${novAuto.idAutomobil})</h4>
	<%--  ${novi.proizvodjac.naziv} ${novi.model.naziv}--%>
	<div class="centriraj">
	<form:form action="/AutoOglasi/oglasi/sacuvajOglas" method="post" modelAttribute="oglas">
			Mesto: <form:input type="text" path="mesto"/><br>
			Cena: <form:input type="number" path="cena"/><br>
				<form:input type="hidden" value="${novAuto.idAutomobil}" path="automobil"/> 
 				<button type="submit">Dodaj</button>
	</form:form>
	</div>
	<c:if test="${!empty novOglas}">
		<h3 style="text-align: center;">Oglas uspesno dodat! ID oglasa: ${novOglas.idOglas}</h3>
	</c:if>
	
</body>
</html>