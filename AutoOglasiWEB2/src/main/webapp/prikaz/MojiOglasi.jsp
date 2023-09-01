<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Moji oglasi</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>
	<div class="main-container">
		<h1 class="naslov"">MOJI OGLASI</h1>
		<div class="">
			<button>
				<a href="/AutoOglasi/oglasi/generisiIzvestajOglasi">Generisi
					izvestaj</a>
			</button>
		</div>
		<div class="lista-oglasa">
			<c:forEach items="${mojiOglasi}" var="o">
				<div class="card">
					<h1>${o.automobil.proizvodjac.naziv}${o.automobil.model.naziv}</h1>
					<p class="price">${o.cena}e</p>
					<p>${o.mesto}</p>
					<button>
						<a href="/AutoOglasi/oglasi/detaljiOglas?idOglas=${o.idOglas}">Detalji</a>
					</button>
					<button>
						<a href="/AutoOglasi/oglasi/obrisiOglas?idOglas=${o.idOglas}">Obrisi</a>
					</button>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>

</body>
</html>