<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalji</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>

			<br>
			<div class="oglas-detalji-container">
			<h1 class="oglas-naslov">${prikaziOglas.automobil.proizvodjac.naziv} ${prikaziOglas.automobil.model.naziv}</h1>
				<div class="oglas-detalji-leva">
					<p><b>Cena:</b> ${prikaziOglas.cena}e</p>
					<p><b>Mesto:</b> ${prikaziOglas.mesto}</p>
					<p><b>Karoserija:</b> ${prikaziOglas.automobil.karoserija}</p>
					<p><b>Gorivo:</b> ${prikaziOglas.automobil.gorivo}</p>
					<p><b>Godiste:</b> ${prikaziOglas.automobil.godiste}</p>
					</div>
					<div class="oglas-detalji-desna">
					<p><b>Kubikaza:</b> ${prikaziOglas.automobil.kubikaza}cm3</p>
					<p><b>Snaga:</b> ${prikaziOglas.automobil.snaga} kW</p>
					<p><b>Broj pregleda:</b> ${prikaziOglas.brPregleda}</p>
					<p><b>Objavljen:</b> ${prikaziOglas.datumObjave}</p>
					<p><b>Prodavac:</b> ${prikaziOglas.clan.ime} ${prikaziOglas.clan.prezime}</p>
				</div>
			</div>
			<br> <br>
			<h1></h1>
			<div class="oglas-kontakt-container">
				<h1 class="oglas-naslov">Kontakt</h1>
				<form action="/AutoOglasi/oglasi/sacuvajOmiljeni" method="post">
					<input type="hidden" name="idOglas" value="${prikaziOglas.idOglas}">
					<label for="napomena">Napomena: </label>
					<input id="napomena" type="text" name="napomena">
					<button type="submit">Sacuvaj oglas</button>
				</form>
			
			<c:if test="${!empty potvrdaCuvanje}">
				<h3 style="text-align: center;">Status cuvanja:
					${potvrdaCuvanje}</h3>
			</c:if>

			<br> <br>
			

				<form action="/AutoOglasi/oglasi/posaljiPoruku" method="post">
					<input type="hidden" name="idKorisnik"
						value="${prikaziOglas.clan.idClan}"> <input type="hidden"
						name="idOglas" value="${prikaziOglas.idOglas}">
						<label for="sadrzaj">Poruka prodavcu(${prikaziOglas.clan.korisnickoIme}): </label>
						<input id="sadrzaj" type="text" name="sadrzaj">
					<button type="submit">Posalji poruku</button>
				</form>
			</div>
			<br>
			<c:if test="${!empty potvrda}">
				<h3 style="text-align: center;">Status poruke
					${prikaziOglas.clan.korisnickoIme}: ${potvrda}</h3>
			</c:if>

			<br>
</body>
</html>