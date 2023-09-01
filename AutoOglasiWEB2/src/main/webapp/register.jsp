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
<title>Registracija</title>
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="main-container">
	<div class="center" style="font-size: 20px; text-align: left;">
		<div class="form-style">

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
						<td>Uloga: </td>
						<td><sf:select path="ulogas" items="${roles}"
								itemValue="idUloga" itemLabel="naziv" cssClass="select-minimal"/></td>
					</tr>
					
				</table>
				<div style="text-align: center;"><button type="submit">Registruj se</button></div>
			</sf:form>
		</div>
	</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
</body>
</html>