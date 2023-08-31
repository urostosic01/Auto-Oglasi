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
<title>Omiljeni</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>

	<h1 style="text-align: center;">SACUVANI OGLASI</h1>
	<div class="">
		<button>
			<a href="/AutoOglasi/oglasi/generisiIzvestajSacuvani">Generisi
				izvestaj</a>
		</button>
	</div>
	<div class="kontejner">
		<c:forEach items="${sacuvani}" var="s">
			<div class="card">
				<h1>${s.ogla.automobil.proizvodjac.naziv}
					${s.ogla.automobil.model.naziv}</h1>
				<br>
				<p class="price">${s.ogla.cena}e</p>
				<p>${s.ogla.mesto}</p>
				<button>
					<a href="/AutoOglasi/oglasi/detaljiOglas?idOglas=${s.ogla.idOglas}">Detalji</a>
				</button>
			</div>
		</c:forEach>
	</div>
</body>
</html>