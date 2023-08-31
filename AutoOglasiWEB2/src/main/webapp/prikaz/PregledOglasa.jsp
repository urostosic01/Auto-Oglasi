<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<meta charset="ISO-8859-1">
<title>Auto oglasi</title>
<style type="text/css">
</style>
<script type="text/javascript">
	const dropdown = document.getElementById("selectSort");

	dropdown.addEventListener("change", function() {
		document.getElementById("formSort").submit();
	});
</script>
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>


	<h1 style="text-align: center;">OGLASI:</h1>
	<security:authorize access="hasRole('registrovani') || hasRole('administrator')">
		<div class="navSort">
			<form action="/AutoOglasi/oglasi/sortiranje" method="post"
				id="formSort">
				<select id="selectSort" name="tipSort" class="select-minimal">
					<option selected="selected">--Sortiranje--</option>
					<option value="cenaRastuce">Cena rastuce</option>
					<option value="cenaOpadajuce">Cena opadajuce</option>
					<option value="najnoviji">Prvo najnoviji oglasi</option>
					<option value="najstariji">Prvo najstariji oglasi</option>
				</select>
				<button type="submit">Primeni</button>
			</form>
		</div>
		<div class="navPretraga">
			<form action="/AutoOglasi/oglasi/nadjiModelePretraga" method="get">
				<select name="idProizvodjac" class="select-minimal">
					<c:forEach items="${proizvodjaci}" var="p">
						<option value="${p.idProizvodjac}">${p.naziv}</option>
					</c:forEach>
				</select>
				<button type="submit">Prikazi modele</button>
			</form>
			<c:if test="${!empty modeliPoProizvodjacu}">
				<form action="/AutoOglasi/oglasi/nadjiOglaseModela" method="get">
					<input type="hidden" value="${odabraniProizvodjac.idProizvodjac}"
						name="idProizvodjac"> <select name="idModel"
						class="select-minimal">
						<c:forEach items="${modeliPoProizvodjacu}" var="m">
							<option value="${m.idModel}">${m.naziv}</option>
						</c:forEach>
					</select>
					<button type="submit">Prikazi oglase</button>
				</form>
			</c:if>
		</div>
	</security:authorize>

	<br>
	<br>
	<div class="kontejner">
		<c:forEach items="${oglasi}" var="o">
			<div class="card">
				<h1>${o.automobil.proizvodjac.naziv} ${o.automobil.model.naziv}</h1>
				<br>
				<p class="price">${o.cena}e</p>
				<p>${o.mesto}</p>
				<button>
					<a href="/AutoOglasi/oglasi/detaljiOglas?idOglas=${o.idOglas}">Detalji</a>
				</button>
			</div>
		</c:forEach>
	</div>
</body>
</html>