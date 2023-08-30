<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">

<title>O nama</title>
</head>
<body>

	<div class="topnav">
<%-- 		<img class="logo" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png">
 --%>  	<a href="/AutoOglasi/prikaz/Onama.jsp">O nama</a> 
 		<a href="/AutoOglasi/auth/loginPage">Login</a> 
   		<a href="/AutoOglasi/gost/sviOglasi">Oglasi</a>
 
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
	<div class="main-container">
		<h1 style="text-align: center;">O nama</h1>
		<p>Sajt AutoOglasi omogucava oglasavanje vozila i rezervnih delova, 
			efikasno povezuje kupce i prodavce i pruza savete i informacije oko kupoprodaje vozila.</p>
		
		
		<p style="text-align: center;"><img style="width: 40%; height: 40%" alt="logo" src="${pageContext.request.contextPath}/img/logo_transparent.png"></p>
		
		
		<h2 style="text-align: center;">Cemu tezimo</h2>
		<p>
		Sajt AutoOglasi zeli da utice na unapredjenje i razvoj trzista automobila kroz povecanje koriscenja Interneta u kupoprodaji vozila.
		<p/>
		<p>Kupcima ovaj sajt zeli da olaksa donosenje prave odluke o kupovini, kroz kreiranje mogucnosti lakog uporedjivanja sirokog spektra 
			ponude vozila, auto usluga i rezervnih delova, kao i kroz pruzanje zaokruzene celine prakticnih i neophodnih informacija.
		</p>
		<p>Prodavcima, auto salonima i auto dilerima sajt AutoOglasi tezi da pomogne u pospesivanju prodaje koriscenjem Interneta u poslovanju i omoguci
			 im brze i lakse povezivanje sa kupcima.</p>
		</p>
	</div>	
</body>
</html>