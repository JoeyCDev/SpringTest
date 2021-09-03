<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>통나무 펜션</title>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

        <link rel="stylesheet" href="/lesson08-tmp/style.css" type="text/css">
    </head>

    <body>
        <div class="wrap" >
            
            <jsp:include page = "/lesson08-tmp/jsp/header.jsp"/>

            <section class="banner">
                <img src="/lesson08-tmp/images/test06_banner1.jpg" id="bannerImage">
            </section>
            <sction class="d-flex">
                <article class="reservation d-flex justify-content-center align-items-center">
                    <div class="display-4">
                        실시간 <br>
                        예약 하기 
                    </div>
                </article>
                <article class="reservation-confirm">
                    <div class="m-4">
                        <div class="d-flex align-items-end">
                            <h3 class="mr-4">예약 확인</h3>
                        
                            
                        </div>
                        <div class="member-input mt-3" id="member">
                            <div class="input-gorup form-inline">
                                <label class="input-label">이름 :</label>
                                <input type="text" class="form-control text-input" id="name">
                            </div>
                            <div class="input-gorup form-inline mt-3">
                                <label class="input-label">전화번호 :</label>
                                <input type="text" class="form-control text-input" id="phoneNumber">
                            </div>

                        </div>
                        <div class="d-flex justify-content-end">
                            <button class="btn btn-success mt-3 mr-5" id="lookupBtn">조회 하기</button>
                        </div>
                    </div>
                </article>
                <article class="reservation-call d-flex justify-content-center align-items-center">
                    <div>
                        <h3>예약문의 : </h3>
                        <h1>010-</h1>
                        <h1>000-1111</h1>
                    </div>
                </article>
            </sction>

            <jsp:include page = "/lesson08-tmp/jsp/footer.jsp"/>


        </div>

    <script>
        $(document).ready(function() {

           $("#lookupBtn").on("click",function(){
        	  
        	   var name = $("#name").val();
        	   var phoneNumber = $("#phoneNumber").val();
        	   
        	   $.ajax({
        		  
        		   type:"post",
        		   url:"/lesson08/lookup",
        		   data:{"name":name,"phoneNumber":phoneNumber},
        		   success:function(data){
        			   if(data == null){
        				   alert("조회 결과가 없습니다");
        			   }else{
        				   alert(data);
        			   }
        		   },
        		   error:function(e){
        			   alert("error");
        		   }
        		   
        	   });
        	
        	   
           });
           
		           var bannerList = ["/lesson08-tmp/images/test06_banner1.jpg", "/lesson08-tmp/images/test06_banner2.jpg", "/lesson08-tmp/images/test06_banner3.jpg", "/lesson08-tmp/images/test06_banner4.jpg"];
		           var currentImageIndex = 0;
		           setInterval(function() {
		               $("#bannerImage").attr("src", bannerList[currentImageIndex]);
		               currentImageIndex++;
		
		               if(currentImageIndex == bannerList.length) {
		                   currentImageIndex = 0;
		               }
		           }, 3000); 
		      
		           
         });

            
    </script>
    </body>
</html>