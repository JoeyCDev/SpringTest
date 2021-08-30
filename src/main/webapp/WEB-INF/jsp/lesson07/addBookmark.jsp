<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>즐겨 찾기 추가 페이지</title>
<!-- bootstrap CDN link -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

  <%-- AJAX를 사용하려면 더 많은 함수가 있는 js를 포함해야 한다. --%>
  <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
  <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

</head>
<body>

<div class="container">
	<h1>즐겨 찾기 추가하기</h1>
		<label>제목</label>
		<input type="text" class="form-control" name="title" id="titleInput">
		<label>주소</label>
		<input type="text" class="form-control" name="url" id="urlInput">
		<br>
		<button class="btn btn-success" id="addBtn">추가</button>
</div>
	
	<script>
		$(document).ready(function(){
			
			$("#addBtn").on("click",function(){
				var title = $("#titleInput").val();
				var url = $("#urlInput").val();
				
				if(title==null || title ==""){
					alert("제목을 입력하세요!");
					return;
				}
				if(url==null || url==""){
					alert("주소를 입력하세요!");
					return;
				}
				if(!url.startsWith("http://") && !url.startsWith("https://")) {
					alert("잘못된 주소 형식입니다!");
					return;
				}
				
				$.ajax({
					type:"post",
					url:"/lesson07/addBookmark",
					data:{"name":title, "url":url},
					success:function(data){
						if(data.result == "success"){
							location.href="/lesson07/print_bookmark_view"
						}else {
							alert("삽입 실패");
						}
					},
					error : function(e) {
						alert("error");
					}
				});
				
			});
		});
		
				
	</script>

</body>
</html>