<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">

<title>O nama</title>
</head>
<body>

	<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="main-container">
		<div class="o-nama">
		<h1 class="naslov">O nama</h1>
		<p class="onama-text">Dobrodosli na nas sajt sa auto oglasima! Mi smo strastveni
			ljubitelji automobila koji su odlucili da stvore platformu koja
			olaksava proces kupovine i prodaje vozila. Nasa misija je da povezemo
			ljude sirom sveta sa njihovim idealnim automobilima, pruzajuci im
			pouzdanu i jednostavnu platformu za oglasavanje i pretragu vozila.</p>

		<h2 class="naslov-kraci">Nasa Vizija</h2>
		<p class="onama-text">Nasa vizija je da postanemo vodeca online destinacija za sve
			ljubitelje automobila, bez obzira da li traze svoj prvi automobil,
			zele da nadograde postojece vozilo ili pronadju retke i kolekcionarske
			automobile. Zelimo da nasa platforma postane nezaobilazno mesto za
			sve potrebe vezane za automobile.</p>
		<p style="text-align: center;">
			<img style="width: 70%; height: 70%" alt="logo"
				src="${pageContext.request.contextPath}/img/index-cars.png">
		</p>

		<h2 class="naslov-kraci">Sta Nudimo</h2>
		<p class="onama-text">Nas sajt sa auto oglasima nudi bogat izbor vozila razlicitih
			marki, modela, godista i cenovnih kategorija. Bez obzira da li
			trazite luksuzni automobil, porodicni kombi, terenac ili ekonomican
			gradski automobil, verujemo da cete na nasoj platformi pronaci
			savrsen automobil za sebe. Takodje, nudimo korisne resurse kao sto su
			vodici za kupovinu, saveti o odrzavanju i informacije o finansiranju
			vozila.</p>
		</p>

		<p style="text-align: center;">
			<img style="width: 40%; height: 40%" alt="logo"
				src="${pageContext.request.contextPath}/img/logo_transparent.png">
		</p>
		<h2 class="naslov-kraci">Kontaktirajte nas</h2>
		<p class="onama-text">Ako imate pitanja, sugestije ili zelite da saznate vise o nasoj
			platformi, slobodno nas kontaktirajte putem linkova u dnu sajta
			ili putem e-maila. Vasa povratna informacija nam je veoma vazna jer
			nam pomaze da unapredimo i poboljsamo nasu uslugu. Hvala sto
			koristite nas sajt sa auto oglasima! Radujemo se sto vam mozemo
			pomoci da pronadjete savrsen automobil ili da uspesno prodate svoje
			vozilo.</p>
		</div>
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>
	
</body>
</html>