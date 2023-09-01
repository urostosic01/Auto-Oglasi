<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inbox</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<style type="text/css">
.center table {
	margin: auto;
	width: 90%;
	padding: 10px;
}
</style>
</head>
<body>
	<jsp:include page="/template/header.jsp"></jsp:include>

	<div class="main-container">
		<h1 class="naslov">PRIMLJENE</h1>
		<div class="center">


			<div class="poruka-container">
				<ul class="lista-poruka">
					<li class="table-header">
						<div class="kolona kolona-1">Clan</div>
						<div class="kolona kolona-2">Poruka</div>
						<div class="kolona kolona-3"></div>
					</li>
					<c:forEach items="${poruke}" var="p">
						<li class="poruka-red">
							<div class="kolona kolona-1">${p.clan2.korisnickoIme}</div>
							<div class="kolona kolona-2">${p.sadrzaj}</div>
							<form action="/AutoOglasi/oglasi/odgovori" method="post">
								<input type="hidden" value="${p.clan2.idClan}" name="idClan">
								<input type="text" name="sadrzaj">
								<button type="submit">Odgovori</button>
							</form>
						</li>
					</c:forEach>					
				</ul>
				<c:if test="${!empty potvrda}"><p style="text-align: center;">${potvrda}</p></c:if>
			</div>
			</div>
		<br>
		<h1 class="naslov">POSLATE</h1>
		<div class="center">	
			<div class="poruka-container">
				<ul class="lista-poruka">
					<li class="table-header">
						<div class="kolona kolona-1">Clan</div>
						<div class="kolona kolona-2">Poruka</div>
 -->					</li>
					<c:forEach items="${porukePoslate}" var="p2">
						<li class="poruka-red">
							<div class="kolona kolona-1">${p2.clan1.korisnickoIme}</div>
							<div class="kolona kolona-2">${p2.sadrzaj}</div>
						</li>
					</c:forEach>					
				</ul>
				<c:if test="${!empty potvrda}"><p style="text-align: center;">${potvrda}</p></c:if>
			</div>
		</div>		
	</div>
	<jsp:include page="/template/footer.jsp"></jsp:include>

</body>
</html>