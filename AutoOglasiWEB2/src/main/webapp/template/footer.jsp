<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>

	<footer>
		<div class="footer-container">
			<h1 class="footer-naslov">Auto Oglasi</h1>
			<p class="footer-naslov">Imate pitanje? Kontaktirajte nas slobodno.</p>
			<div class="footer-social">
				<a href="#"><i class="fa fa-facebook-square"></i></a> <a href="#"><i
					class="fa fa-instagram"></i></a> <a href="#"><i
					class="fa fa-linkedin-square"></i></a> <a href="#"><i
					class="fa fa-envelope"></i></a>
			</div>
			<div class="footer-navbar">
				<ul>
					<security:authorize access="!isAuthenticated()">
						<li><a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a></li>
						<li><a href="/AutoOglasi/auth/loginPage">Login</a></li>
						<li><a href="/AutoOglasi/auth/registerUser">Registracija</a></li>
						<li><a href="/AutoOglasi/gost/sviOglasi">Oglasi</a></li>
					</security:authorize>

					<security:authorize
						access="hasRole('registrovani') || hasRole('administrator')">
						<li><a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a></li>
						<li><a href="/AutoOglasi/oglasi/sviOglasi">Oglasi</a></li>
						<li><a href="/AutoOglasi/oglasi/unosAutomobila">Dodaj
								oglas</a></li>
						<li><a href="/AutoOglasi/oglasi/prikazSacuvani">Sacuvani</a></li>
						<li><a href="/AutoOglasi/oglasi/prikazPoruke">Poruke</a></li>
						<li><a href="/AutoOglasi/oglasi/mojiOglasi">Moji oglasi</a></li>
					</security:authorize>
					<security:authorize access="hasRole('administrator')">
						<li><a href="/AutoOglasi/admin/unosProizvodjaca">Novo
								vozilo</a></li>
					</security:authorize>
				</ul>
			</div>
		</div>
		<div class="footer-bottom">
			<p>
				Copyright &copy;2023; Designed by <span class="designer">Uros
					Tosic</span>
			</p>
		</div>
	</footer>
</body>
</html>