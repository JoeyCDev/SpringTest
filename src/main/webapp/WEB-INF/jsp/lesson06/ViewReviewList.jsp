<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 페이지</title>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>

<div id="wrap" style="height:800px;" class="mt-4">
		<div class="main-container" style="margin:auto; width:50%">
			<jsp:include page="header.jsp"/>
			<h1>${storeName } - 리뷰</h1>
			<c:forEach var="review" items="${storeReview }">
				<c:choose>
					<c:when test="${review eq null }">
						<div class="m-3 display-4">작성된 리뷰가 없습니다.</div>
					</c:when>
					<c:when test="${review ne null }">
						<div class="list-items border border-info rounded p-3 mb-3">
							<div class="d-flex align-items-center">
								<b>${review.userName }</b> 
								<c:forEach var="i" begin="1" end="${review.point }" step="1">
									<img src="/lesson06-tmp/images/star_fill.png" width="15px" class="ml-1"/>
								</c:forEach>
								<c:if test="${review.point%1==0.5 }">
									<img src="/lesson06-tmp/images/star_half.png" width="15px" class="ml-1"/>
								</c:if>
								<c:forEach var="i" begin="1" end="${5-review.point }" step="1">
									<img src="/lesson06-tmp/images/star_empty.png" width="15px" class="ml-1"/>
								</c:forEach>
							</div>
							<br>
							<small class="text-secondary"><fmt:formatDate value="${review.createdAt }" pattern="yyyy년 M월 d일"/></small>
							<br>
							<div>${review.review }</div>
							<samll class="bg-secondary rounded">${review.menu }</small>
						</div>
					</c:when>
				</c:choose>
			</c:forEach>
			<hr>
		<jsp:include page="footer.jsp"/>
		</div>
	</div>
	
</body>
</html>