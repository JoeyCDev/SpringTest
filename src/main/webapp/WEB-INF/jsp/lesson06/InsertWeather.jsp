<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>날씨 입력 페이지</title>
 <link rel="stylesheet" type="text/css" href="/lesson06-tmp/files/style.css">

<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</head>
<body>
	<div id="wrap2" class="d-flex">
		<jsp:include page="/lesson06-tmp/files/nav.jsp"/>
		<div class="insert-container container mt-4 col-8">
			<h2 class="mb-5">날씨 입력</h2>
			<form method="get" action="/lesson06/example1/insertResult">
				<div class="d-flex d-wrap">
					<div class="input-group m-4">
						<label class="mr-2">날짜 </label>
						<input type="text" name="date" class="form-control">
					</div>
					<div class="input-group m-4">
						<label class="mr-2">날씨</label>
						<select name="weather" class="form-control">
							<option value="맑음">맑음</option>
							<option value="흐림">흐림</option>
							<option value="구름조금">구름조금</option>
							<option value="비">비</option>
						</select>
					</div>
					<div class="input-group m-4">
						<label class="mr-2">미세먼지</label>
						<select name="microDust" class="form-control">
							<option value="보통">보통</option>
							<option value="좋음">좋음</option>
							<option value="나쁨">나쁨</option>
							<option value="최악">최악</option>
						</select>
					</div>
				</div>
				<div class="d-flex d-wrap">
					<div class="input-group  m-4">
						<label class="mr-2">기온 </label>
						<input type="text" class="form-control" name="temperatures">
						<div class="input-group-append">
							<span class="input-group-text">°C</span>
						</div>
					</div>
					<div class="input-group  m-4">
						<label class="mr-2">강수량 </label>
						<input type="text" class="form-control" name="precipitation">
						<div class="input-group-append">
							<span class="input-group-text">mm</span>
						</div>
					</div>
					<div class="input-group  m-4">
						<label class="mr-2">풍속 </label>
						<input type="text" class="form-control" name="windSpeed">
						<div class="input-group-append">
							<span class="input-group-text">km/h</span>
						</div>
					</div>
				</div>
				<div class="d-flex justify-content-end">
					<button class="btn btn-success" type="submit">저장</button>
				</div>
			</form>
		</div>
	</div>
	<hr>
	<jsp:include page="/lesson06-tmp/files/footer.jsp"/>

</body>
</html>