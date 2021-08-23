<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL Core 라이브러리 2</title>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

<!--  1.JSTL forEach -->

<div class="container">
	<h1>HOT 5</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>순위</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="musicRanking" items="${result }" varStatus="status">
				<tr>
					<td>${status.count }</td>
					<td>${musicRanking }</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<!--  2.JSTL 응용하기 -->

<div class="container">
	<h1>맴버쉽</h1>
	<table class="table text-center">
		<thead>
			<tr>
				<th>이름</th>
				<th>전화 번호</th>
				<th>등급</th>
				<th>포인트</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="membership" items="${result2 }" varStatus="status">
				<tr>
					<td>${membership.name }</td>
					<td>${membership.phoneNumber }</td>
					<c:set var="grade" value="${membership.grade }"/>
					<c:choose>
						<c:when test="${grade  eq 'VIP'}">
							<td class="text-danger">${grade }</td>
						</c:when>
						<c:when test="${grade  eq 'GOLD'}">
							<td class="text-warning">${grade }</td>
						</c:when>
						<c:otherwise>
							<td>${grade }</td>
						</c:otherwise>
					</c:choose>
					<c:set var="point" value="${membership.point }"/>
					<c:choose>
						<c:when test="${point>=5000}">
							<td class="text-primary">${point }P</td>
						</c:when>
						<c:otherwise>
							<td>${point }P</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>