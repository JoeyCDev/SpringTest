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
		<div class="url-container d-flex">
		<input type="text" class="form-control mr-3" name="url" id="urlInput">
		<button class="btn btn-primary" id="isDuplicateBtn">중복확인</button>
		</div>
		<small class="text-danger d-none" id="duplicate-msg">중복된 url 입니다</small>
		<small class="text-success d-none" id="nonDuplicate-msg">저장 가능한 url 입니다</small>
		<br>
		<button class="btn btn-success w-100 mt-2" id="addBtn">추가</button>
</div>
	
	<script>
		$(document).ready(function(){
			
			var isChecked = false;
			var isDuplicate = true;
			
			
			$("#isDuplicateBtn").on("click",function(){
				
				var url = $("#urlInput").val();
				
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
					url:"/lesson07/isDuplicate",
					data:{"url":url},
					success:function(data){
						isChecked=true;
						if(data.isDuplicate){
							isDuplicate=true;
							$("#duplicate-msg").removeClass("d-none");
							$("#nonDuplicate-msg").addClass("d-none");
						}else{
							isDuplicate=false;
							$("#nonDuplicate-msg").removeClass("d-none");
							$("#duplicate-msg").addClass("d-none");
						}
					},
					error:function(e){
						alert("error!");
					}
					
				});
				
				
				
			});
			
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
				
				if(!isChecked){
					alert("중복체크를 진행해 주세요!");
					return;
				}
				
				if(isDuplicate){
					alert("중복된 이름은 등록 불가합니다!");
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