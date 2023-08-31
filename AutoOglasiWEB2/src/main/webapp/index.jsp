<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pocetna</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>

	<h1 style="text-align: center;">OGLASI</h1>
	<img src="${pageContext.request.contextPath}/img/logo_transparent.png"
		class="center" style="height: 200px; width: 200px;" />

	<div class="kontejner">
		<c:forEach items="${oglasi}" var="o">
			<div class="card">
				<h1>${o.automobil.proizvodjac.naziv}${o.automobil.model.naziv}</h1>
				<br>
				<p class="price">${o.cena}e</p>
				<p>${o.mesto}</p>
			</div>
		</c:forEach>
	</div>
</body>
</html>