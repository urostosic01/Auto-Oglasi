<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%><!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Detalji</title>
<style type="text/css">
h3 {
text-align: center;
}

</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
</head>
<body>
	<div class="topnav">
<%-- 		<img class="logo" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png">
 --%>  		<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
		<security:authorize access="isAuthenticated()">
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
	<h1 style="text-align: center;">${prikaziOglas.automobil.proizvodjac.naziv} ${prikaziOglas.automobil.model.naziv}</h2> <br>
	<h1 style="text-align: center;"></h2><br>
	<div style="border-style: solid; border-color: #333; border-radius: 20px; text-align: justify; ">
		<h3>Cena: ${prikaziOglas.cena}e</h3> 
		<h3>Mesto: ${prikaziOglas.mesto}</h3> 
		<h3>Karoserija: ${prikaziOglas.automobil.karoserija}</h3>
		<h3>Gorivo: ${prikaziOglas.automobil.gorivo}</h3>
		<h3>Godiste: ${prikaziOglas.automobil.godiste}</h3>
		<h3>Kubikaza: ${prikaziOglas.automobil.kubikaza}cm3</h3> 
		<h3>Snaga: ${prikaziOglas.automobil.snaga} kW</h3> 
		<h3>Broj pregleda: ${prikaziOglas.brPregleda}</h3> 
		<h3>Objavljen: ${prikaziOglas.datumObjave}</h3>
		<h3>Prodavac: ${prikaziOglas.clan.ime} ${prikaziOglas.clan.prezime}</h3>
	</div>
	<br>
	<br>
	<div class="centriraj">
	<form action="/AutoOglasi/oglasi/sacuvajOmiljeni" method="post">
		<input type="hidden" name="idOglas" value="${prikaziOglas.idOglas}">
		Napomena: <input type="text" name="napomena">
		<button type="submit">Sacuvaj oglas</button>
	</form>
	</div>
	<
	<c:if test="${!empty potvrdaCuvanje}">
		<h3 style="text-align: center;">Status cuvanja: ${potvrdaCuvanje}</h3>
	</c:if>
	
	<br><br>
	<div class="centriraj">
	
	<form action="/AutoOglasi/oglasi/posaljiPoruku" method="post">
		<input type="hidden" name="idKorisnik" value="${prikaziOglas.clan.idClan}">
		<input type="hidden" name="idOglas" value="${prikaziOglas.idOglas}">
		Poruka prodavcu(${prikaziOglas.clan.korisnickoIme}): <input type="text" name="sadrzaj">
		<button type="submit">Posalji poruku</button>
	</form>
	</div>
	<br>
	<c:if test="${!empty potvrda}">
		<h3 style="text-align: center;">Status poruke ${prikaziOglas.clan.korisnickoIme}: ${potvrda}</h3>
	</c:if>
	
	<br>
	
</body>
</html>