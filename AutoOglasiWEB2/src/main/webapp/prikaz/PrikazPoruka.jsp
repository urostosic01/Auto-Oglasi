<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inbox</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<style type="text/css">
.center table{
  margin: auto;
  width: 90%;
  padding: 10px;
}</style>
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

	<h2 style="text-align: center;">PRIMLJENE</h2>
	<div class="center">
	<table border="1">
	<p style="text-align: center;"><c:if test="${!empty potvrda}">
				${potvrda}
	</c:if></p>
	<tr>
		<th>Poruka od: </th>
		<th>Sadrzaj:</th>
		<th>Odgovori</th>
		
	</tr>
	<c:forEach items="${poruke}" var="p">
		<tr>
			<td>${p.clan2.korisnickoIme}</td>
			<td>${p.sadrzaj}</td>
			<td>
				<form action="/AutoOglasi/oglasi/odgovori" method="post">
					<input type="hidden" value="${p.clan2.idClan}" name="idClan">
					<input type="text" name="sadrzaj">
					<input type="submit" value="Odgovori">
				</form>
			</td>
		</tr>
	</c:forEach>
	</table>
	</div>
	
	<h2 style="text-align: center;">POSLATE</h2>	
	
	<div class="center">
	<table border="1">
	<p style="text-align: center;"><c:if test="${!empty potvrda}">
				${potvrda}
	</c:if></p>
	<tr>
		<th>Poruka za: </th>
		<th>Sadrzaj:</th>		
	</tr>
	<c:forEach items="${porukePoslate}" var="p2">
		<tr>
			<td>${p2.clan1.korisnickoIme}</td>
			<td>${p2.sadrzaj}</td>
		</tr>
	</c:forEach>
	</table>
	</div>
</body>
</html>