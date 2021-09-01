<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록 페이지</title>
<!-- bootstrap CDN link -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>
<!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
	
<!-- stylesheet -->
<link rel="stylesheet" href="/lesson08-tmp/style.css" type="text/css">
</head>
<body>

	<div class="wrap" >
            
            <jsp:include page = "/lesson08-tmp/jsp/header.jsp"/>
            	
            	<div class="main-container">
            		<h2 class="text-center m-4">예약 목록 보기</h1>
	            	<table class="table text-center">
	            		<thead>
	            			<tr>
	            				<th>이름</th>
	            				<th>예약날짜</th>
	            				<th>숙박일수</th>
	            				<th>숙박인원</th>
	            				<th>전화번호</th>
	            				<th>예약상태</th>
	            				<th></th>
	            			</tr>
	            		</thead>
	            		<tbody>
	            			<c:forEach var="booking" items="${bookingList }">
	            			<tr>
	            				<td>${booking.name }</td>
	            				<td><fmt:formatDate value="${booking.date }" pattern="yyyy년 M월 dd일"/></td>
	            				<td>${booking.day }</td>
	            				<td>${booking.headcount }</td>
	            				<td>${booking.phoneNumber }</td>
	            				<c:choose>
	            					<c:when test="${booking.state  eq '대기중'}">
	            						<td class="text-info">${booking.state }</td>
	            					</c:when>
	            					<c:otherwise>
	            						<td class="text-success">${booking.state }</td>
	            					</c:otherwise>
	            				</c:choose>
	            				
	            				<td><button type="button" class="btn btn-danger">삭제</button></td>
	            			</tr>
	            			</c:forEach>
	            		</tbody>
	            	</table>
            	</div>
            
          	<jsp:include page = "/lesson08-tmp/jsp/footer.jsp"/>
            
    </div>

</body>
</html>