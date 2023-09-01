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

</head>


<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="main-container">
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
							<td><input type="text" name="username" placeholder=""
								required></td>
						</tr>
						<tr>
							<td>Sifra</td>
							<td><input type="password" name="password" placeholder=""
								required></td>
						</tr>

						<tr>
							<td><input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" /></td>
							<td><button type="submit">Prijava</button></td>
						</tr>
					</table>
					<br /> <br /> Zelite da nam se pridruzite?<br>
					<br>					
				</form>
					<a href="/AutoOglasi/auth/registerUser"><button>Registrujte se</button></a>
			</div>

		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>


</body>
</html>