<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<meta charset="ISO-8859-1">
<title>Auto oglasi</title>
<style type="text/css">
.navSort{
	display: flex;
	margin-bottom: 20px;
}
.navSort button, .navPretraga button {
	margin-right: 10px;
	background-color: #555555;
  	border: none;
  	color: white;
  	padding: 15px 32px;
  	text-align: center;
  	text-decoration: none;
  	font-size: 15px;
}
.navSort button:hover, .navPretraga button:hover {
	opacity: 0.7;
}

.navPretraga select{
	background-color: #555555;
  	color: white;
  	padding: 12px;
  	border: none;
  	font-size: 15px;
  	box-shadow: 0 5px 25px rgba(0, 0, 0, 0.2);
  	-webkit-appearance: button;
  	appearance: button;
  	outline: none;
  	margin-bottom: 10px;
}

</style>
</head>
<body>
	<div class="topnav">
<%-- 		<img class="logo" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png">
 --%>
 		<security:authorize access="!isAuthenticated()">
			<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
			<a href="/AutoOglasi/auth/loginPage">Login</a> 
			<a href="/AutoOglasi/gost/sviOglasi">Oglasi</a>
		</security:authorize>
		
		<security:authorize access="isAuthenticated()">
			<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
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

	<h1 style="text-align: center;">OGLASI:</h1>
	<div class="navSort">
		<form action="/AutoOglasi/oglasi/sortCenaRastuce" method="get">
			<button type="submit">Cena rastuce</button>
		</form>
		<form action="/AutoOglasi/oglasi/sortCenaOpadajuce" method="get">
			<button type="submit">Cena opadajuce</button>
		</form>
		<form action="/AutoOglasi/oglasi/sortDatumNajnoviji" method="get">
			<button type="submit">Prvo najnoviji</button>
		</form>
		<form action="/AutoOglasi/oglasi/sortDatumNajstariji" method="get">
			<button type="submit">Prvo najstariji</button>
		</form>
		
		<button><a href="/AutoOglasi/oglasi/izvestajPocetnik" style="color: white;">Izvestaj pocetnik</a>
		</button>
	</div>
	<div class="navPretraga">
	<form action="/AutoOglasi/oglasi/nadjiModelePretraga" method="get">
			<select name="idProizvodjac">
				<c:forEach items="${proizvodjaci}" var="p">
					<option value="${p.idProizvodjac}">${p.naziv}</option>
				</c:forEach>
			</select> 
			<button type="submit">Prikazi modele</button>
	</form>
	<c:if test="${!empty modeliPoProizvodjacu}">
				<form action="/AutoOglasi/oglasi/nadjiOglaseModela" method="get">
					<input type="hidden" value="${odabraniProizvodjac.idProizvodjac}" name="idProizvodjac">
					<select name="idModel">
						<c:forEach items="${modeliPoProizvodjacu}" var="m">
							<option value="${m.idModel}">${m.naziv}</option>
						</c:forEach>
					</select>
					<button type="submit">Prikazi oglase</button>
				</form>
	</c:if>
	</div>
	<br><br>
	<div class="kontejner">
		<c:forEach items="${oglasi}" var="o">
			<div class="card">
				<h1>${o.automobil.proizvodjac.naziv} ${o.automobil.model.naziv}</h1><br>
				<p class="price">${o.cena}e</p>
				<p>${o.mesto}</p>
				<button><a href="/AutoOglasi/oglasi/detaljiOglas?idOglas=${o.idOglas}">Detalji</a></button>
			</div>
		</c:forEach>
	</div>
</body>
</html>