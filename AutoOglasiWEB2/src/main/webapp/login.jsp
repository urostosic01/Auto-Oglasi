<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<html>
<head>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<meta charset="UTF-8">
<title>Prijava</title>

<script type="text/javascript">
//auto expand textarea
function adjust_textarea(h) {
    h.style.height = "20px";
    h.style.height = (h.scrollHeight)+"px";
}
</script>

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
	

		<div class="center" style="font-size: 25px; text-align: center;">

			<c:url var="loginUrl" value="/login" />
			<c:if test="${not empty param.error}">
				<div class="alert alert-danger">
					<p>Pogresni podaci.</p>
				</div>
			</c:if>
			<div class="form-style">
			
			<form action="${loginUrl}" method="post">
				<table>
					<tr>
						<td>Korisnicko ime</td>
						<td><input type="text" name="username"
							placeholder="" required></td>
					</tr>
					<tr>
						<td>Sifra</td>
						<td><input type="password" name="password"
							placeholder="" required></td>
					</tr>
					
					<tr>
						<td><input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" /></td>
						<td><input type="submit" value="Prijava"></td>
					</tr>
				</table>
				<br /> <br /> Zelite da nam se pridruzite?<br> <a href="/AutoOglasi/auth/registerUser">Registrujte se</a>
			</form>
			</div>
			
		</div>

</body>
</html>