<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Izvestaj za pocetnik</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="main-container">
		<h1 class="naslov">Izvestaj za pocetnika</h1>

		<div class="izvestaj-container">

			<form action="/AutoOglasi/oglasi/generisiIzvestajPocetnik">
				<select name="idProizvodjac" class="select-minimal">
					<c:forEach items="${proizvodjaci}" var="p">
						<option value="${p.idProizvodjac}">${p.naziv}</option>
					</c:forEach>
				</select> Godiste(minimalno): <input type="number" name="godiste">
				Cena(maksimalna): <input type="number" name="cena">
				<button type="submit">Generisi</button>
			</form>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>

</body>
</html>