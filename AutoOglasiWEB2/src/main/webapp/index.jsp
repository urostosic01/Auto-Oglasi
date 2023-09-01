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
	<div class="main-container">
		<h1 style="text-align: center;">Dobrodosli <security:authorize access="isAuthenticated()">
					<security:authentication property="principal.username" />
				</security:authorize> na Nas Sajt za Auto Oglase</h1>
		<img src="${pageContext.request.contextPath}/img/index-cars.png"
			class="center" />

		<p>Trazite savrsen automobil? Zelite prodati svoje vozilo brzo i
			jednostavno? Mi smo ovde da vam pomognemo! Nasa stranica je centralna
			destinacija za sve vase potrebe vezane za automobile. Bez obzira da
			li ste u potrazi za porodicnim SUV-om, sportskim autom, ili
			ekonomicnim gradskim vozilom, ovde cete pronaci sirok izbor vozila
			koja odgovaraju vasim zeljama i potrebama.</p>
		<p>Nema boljeg mesta za pronalazenje svog sledeceg automobila ili
			prodaju postojeceg. Uzmite vreme da istrazite nase oglase i
			pronadjite savrsen automobil za vas. Hvala sto ste deo nase
			automobilske zajednice! Spremni smo da vam pomognemo da ostvarite
			svoje automobilske snove.</p>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>

</body>
</html>