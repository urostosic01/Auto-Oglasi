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
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">

</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="main-container">
	<h3 class="naslov">Uspesno dodat: ${novAuto.proizvodjac.naziv}
		${novAuto.model.naziv} (${novAuto.idAutomobil})</h3>
	<div class="unos-oglasa-container">
		<form:form action="/AutoOglasi/oglasi/sacuvajOglas" method="post"
			modelAttribute="oglas">
			Mesto: <form:input type="text" path="mesto" />
			<br>
			Cena: <form:input type="number" path="cena" />
			<br>
			<form:input type="hidden" value="${novAuto.idAutomobil}"
				path="automobil" />
			<button type="submit">Dodaj</button>
		</form:form>
	</div>
	<c:if test="${!empty novOglas}">
		<h3 style="text-align: center;">Oglas uspesno dodat! ID oglasa:
			${novOglas.idOglas}</h3>
	</c:if>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
	
</body>
</html>