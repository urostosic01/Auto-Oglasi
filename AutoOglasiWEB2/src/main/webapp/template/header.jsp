<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<div class="topnav">
		<security:authorize access="!isAuthenticated()">
			<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a>
			<a href="/AutoOglasi/auth/loginPage">Login</a>
			<a href="/AutoOglasi/gost/sviOglasi">Oglasi</a>
		</security:authorize>

		<security:authorize access="hasRole('registrovani') || hasRole('administrator')">
			<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a>		
			<a href="/AutoOglasi/oglasi/sviOglasi">Oglasi</a>
			<a href="/AutoOglasi/oglasi/unosAutomobila">Dodaj oglas</a>
			<a href="/AutoOglasi/oglasi/prikazSacuvani">Sacuvani</a>
			<a href="/AutoOglasi/oglasi/prikazPoruke">Poruke</a>
			<a href="/AutoOglasi/oglasi/mojiOglasi">Moji oglasi</a>
			<a style="float: right;" href="/AutoOglasi/auth/logout">Odjava</a>
		</security:authorize>
		<security:authorize access="hasRole('administrator')">
			<a href="/AutoOglasi/admin/unosProizvodjaca">Nov proizvodjac</a>
		</security:authorize>
	</div>

</body>
</html>