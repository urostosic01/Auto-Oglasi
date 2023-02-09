<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="topnav">
<%-- 		<img class="logo" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png">
 --%>  	<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
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
	<!-- <div class="sidenav">
		<a href="/RentACar">Registracija</a> <a href="/RentACar">Login</a> <a
			href="/RentACar/auto/unosAutomobila">Unos automobila</a> <a
			href="/RentACar/auto/unosIznajmljivanja">Iznajmljivanje
			automobila</a> <a href="/RentACar/auto/getAutomobili">Prikaz svih
			automobila</a>
	</div> -->


		<div class="center" style="font-size: 20px; text-align: left;">
			<div class="form-style-8">

			<sf:form modelAttribute="user" action="register" method="post">
				<table>
					<tr>
						<td>Ime:</td>
						<td><sf:input path="ime" /></td>
					</tr>
					<tr>
						<td>Prezime:</td>
						<td><sf:input path="prezime" /></td>
					</tr>
					<tr>
						<td>Korisnicko ime:</td>
						<td><sf:input path="korisnickoIme" /></td>
					</tr>
					<tr>
						<td>Lozinka:</td>
						<td><sf:password path="sifra" /></td>
					</tr>
					<tr>
						<td>Adresa:</td>
						<td><sf:input path="adresa" /></td>
					</tr>
					<tr>
						<td>Broj telefona:</td>
						<td><sf:input path="brojTelefona" /></td>
					</tr>
					<tr>
						<td><sf:select path="ulogas" items="${roles}"
								itemValue="idUloga" itemLabel="naziv" /></td>
					</tr>
					<tr>
						<td><input type="submit" value="Sacuvaj"></td>
					</tr>
				</table>
			</sf:form>
			</div>
		</div>
</body>
</html>