<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<meta charset="UTF-8">
<title>Auto oglasi</title>
<style type="text/css">

.logo {
    display: inline-block;
    float: left;
    vertical-align: top;
    width: 50px;
    height: 50px;
    margin-right: 20px;
    margin-top: 15px;    /* if you want it vertically middle of the navbar. */
}
</style>
</head>
<body>
	<div class="topnav">
<%-- 		<img class="logo" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png">
 --%>  		<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
  			<a href="/AutoOglasi/auth/loginPage">Login</a> 
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
	
		
		<div class="center" style="font-size: 25px; text-align: center;">
			<h1 style="text-align: center;">Dobrodosli
			<security:authorize access="isAuthenticated()">
				<security:authentication property="principal.username" />
			</security:authorize></h1>
		</div>
		<img src="${pageContext.request.contextPath}/img/logo_transparent.png" class="center" style="height: 400px; width: 400px; "/>
		
</body>
</html>