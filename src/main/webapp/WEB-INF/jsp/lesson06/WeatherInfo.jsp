<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 정보 페이지</title>

<link rel="stylesheet" type="text/css" href="style.css">

<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

	<div id="wrap" class="d-flex" style="height:900px;">
		<nav class="main-nav bg-primary col-2" >
			<div class="d-flex justify-content-center mt-2 mb-5"><img src="https://cdn.ilyoseoul.co.kr/news/photo/202012/434545_351639_2648.jpg" height="50px"/>
			</div>
			<ul class="p-0">
				<li class="text-white d-block mb-4">날씨</li>
				<li class="text-white d-block mb-4">날씨입력</li>
				<li class="text-white d-block mb-4">테마날씨</li>
				<li class="text-white d-block mb-4">관측 기후</li>
			</ul>
		</nav>
		<div class="table -container col-10 ml-4 mt-3">
			<h2>과거 날씨</h2>
			<table class="table text-center" style="width:1300px;">
				<thead>
					<tr>
						<th>날짜</th>
						<th>날씨</th>
						<th>기온</th>
						<th>강수량</th>
						<th>미세먼지</th>
						<th>풍속</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="weatherHistory" items="${weatherHistories }" varStatus="status">
					<tr>
						<td><fmt:formatDate value="${weatherHistory.date }" pattern="yyyy년 M월 d일"/></td>
						<c:choose>
							<c:when test="${weatherHistory.weather eq '맑음'}">
								<td><img src="images/sunny.jpg"/></td>
							</c:when>
							<c:when test="${weatherHistory.weather eq '구름조금'}">
								<td><img src="images/partlyCloudy.jpg"/></td>
							</c:when>
							<c:when test="${weatherHistory.weather eq '비'}">
								<td><img src="images/rainy.jpg"/></td>
							</c:when>
							<c:when test="${weatherHistory.weather eq '흐림'}">
								<td><img src="images/cloudy.jpg"/></td>
							</c:when>
						</c:choose>
						<td>${weatherHistory.temperatures }°C</td>
						<td>${weatherHistory.precipitation }mm</td>
						<td>${weatherHistory.microDust }</td>
						<td>${weatherHistory.windSpeed }km/h</td>
					</tr>
					</c:forEach>
				</tbody>
				
			</table>
		</div>
	</div>
	<footer class="footer d-flex" style="height:100px;">
		<div class="footer-logo d-flex justify-content-center" style="width:300px;"><img src="https://cdn.ilyoseoul.co.kr/news/photo/202012/434545_351639_2648.jpg" height="100px"/></div>
		<div class="footer-text ml-4 mt-2 text-secondary">
			<small>(07062) 서울시 동작구 여의대방로16길 61</small>
			<br>
			<small>Copyright@2020 KMA. All Rights RESERVED.</small>
		</div>
	</footer>

</body>
</html>