<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약하기 페이지</title>
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
            
            	<div class="booking-main-container">
            		<h2 class="m-4 text-center">예약하기</h2>
            		<div class="label-input mb-3">
            		<label>이름</label>
            		<input type="text" name="name" id="nameInput" class="form-control">
            		</div>
            		<div class="label-input mb-3">
            		<label>예약날짜</label>
            		<input type="date" name="date" id="dateInput" class="form-control">
            		</div>
            		<div class="label-input mb-3">
            		<label>숙박일수</label>
            		<input type="text" name="day" id="dayInput" class="form-control">
            		</div>
            		<div class="label-input mb-3">
            		<label>숙박인원</label>
            		<input type="text" name="headcount" id="headcountInput" class="form-control">
            		</div>
            		<div class="label-input mb-3">
            		<label>전화번호</label>
            		<input type="text" name="phoneNumber" id="phoneNumberInput" class="form-control">
            		</div>
            		<button type="button" class="btn btn-warning w-100" id="bookingBtn">예약하기</button>
            	</div>
            
            <jsp:include page = "/lesson08-tmp/jsp/footer.jsp"/>
            
            
    </div>
    
    <script>
    	
    	$(document).ready(function(){
    		
    	
    		
    		$("#bookingBtn").on("click",function(){
    			
    			var name = $("#nameInput").val();
        		var date = $("#dateInput").val();
        		var day = $("#dayInput").val();
        		var headcount = $("#headcountInput").val();
        		var phoneNumber = $("#phoneNumberInput").val();
    			
    			if(name==null||name==""){
    				alert("이름을 입력하세요");
    				return;
    			}
    			if(date==null||date==""){
    				alert("예약날짜를 입력하세요");
    				return;
    			}
    			if(day==null||day==""){
    				alert("숙박일수를 입력하세요");
    				return;
    			}
    			if(headcount==null||headcount==""){
    				alert("숙박인원을 입력하세요");
    				return;
    			}
    			if(phoneNumber==null||phoneNumber==""){
    				alert("전화번호를 입력하세요");
    				return;
    			}
    			
    			$.ajax({
    				
    				type:"post",
    				url:"/lesson08/validation_check",
    				data:{"name":name, "date":date, "day":day, "headcount":headcount,"phoneNumber":phoneNumber},
    				success:function(data){
    					if(data.result=="success"){
    						alert("예약 완료 되었습니다");
    					}else{
    						alert("예약 실패!");
    					}
    				},
    				error:function(e){
    					alert("error");
    				}
    				
    			});
    			
    		});
    		
    	});
    
    </script>

</body>
</html>