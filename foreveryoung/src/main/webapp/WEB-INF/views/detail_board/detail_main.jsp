<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<head>
<style>
.detail-all{
   border : 3px blue solid;
   width : 1200px;
   margin-top : 10px;
   maring-right : 20%;
   margin-left : 20%;
   height : 510px;
   position : relative;
}
.main-img{
   border : 2px red solid;
   float:left;
   width : 38%;
   height : 500px;
   margin-left : 15px;
}
#product-img{
	width :445px;
	height:430px;
}
.main-info{
   border : 2px solid green;
   float : right;
   width : 60%;
   height : 500px;
}
.recommend{
     margin : 0 auto;
     border : 3px solid aqua;
     width : 1200px;
     height : 187px;
     padding : 5px;
     padding-top : 5px;   
     position  : relative;   
     margin-top : 10px;
     maring-right : 20%;
     margin-left : 20%;
   }
      *{margin:0;padding:0;}
          ul,li{list-style:none;}
          .slide{height:150px;overflow:hidden;position:relative;}
          .slide li{position:absolute;left:23px;right:23px;top:0;bottom:0;opacity:0;transition:1s;}
          .slide li:nth-child(1){background:#ECF8E0;}
          .slide li:nth-child(2){background:#ECF8E0;}
          .slide li:nth-child(3){background:#ECF8E0;}
          .slide li:nth-child(4){background:#ECF8E0;}
          .slide input{display:none;}
          .slide .bullet{position:absolute;bottom:3px;left:0;right:0;text-align:center;z-index:10;}
          .slide .bullet label{width:10px;height:10px;border-radius:10px;border:2px solid #666;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}
          /* 슬라이드 조작 */
          #pos1:checked ~ ul li:nth-child(1),
          #pos2:checked ~ ul li:nth-child(2),
          #pos3:checked ~ ul li:nth-child(3),
          #pos4:checked ~ ul li:nth-child(4){opacity:1;}
          /* bullet 조작 */
          #pos1:checked ~ .bullet label:nth-child(1),
          #pos2:checked ~ .bullet label:nth-child(2),
          #pos3:checked ~ .bullet label:nth-child(3),
</style>
<script type="text/javascript">
$(function(){
   $("#plus").on("click", function () {
      /* 플러스 버튼 처리 이벤트-1. 수량 조절 시작*/
      var result =$("#result").val();
      result++;
      $("#result").val(result);
      /* 플러스 버튼 처리 이벤트-1. 수량 조절 종료*/

      /* 플러스 버튼 처리 이벤트-2. 가격 연산 시작*/   
      $("#total_amount").val($("#result").val() * $("#sell_price").val());
      /* 플러스 버튼 처리 이벤트-2. 가격 연산 종료*/
   });

   $("#minus").on("click", function () {
      /* 마이너스 버튼 처리 이벤트-1. 연산 전 validation_check 시작*/
      if($("#result").val() ==1){
   return alert("수량은 1 미만일 수 없습니다.");
      }

      /*  마이너스 버튼 처리 이벤트-1. 연산 전 validation_check 종료*/

      /* 마이너스 버튼 처리 이벤트-2. 수량 조절 시작*/
      var result =$("#result").val();
      result--;
      $("#result").val(result);
      /* 마이너스 버튼 처리 이벤트-2. 수량 조절 종료*/

      /* 마이너스 버튼 처리 이벤트-3. 가격 연산 시작*/   
      $("#total_amount").val($("#result").val() * $("#sell_price").val());

      /* 마이너스 버튼 처리 이벤트-3. 가격 연산 종료*/
   });


   $("#nice").on("click", function () {
       /*좋아요 버튼 관련 이벤트 처리 시작*/
       var target = $(this);
       var user_num = $("input[name='user_num']").val();
       var product_no = $("input[name='product_no']").val();

         if(user_num == null || user_num == "") {
            location.href="/member/login";
         }
         
         var url;
         if($(this).attr("value") == "true") {
            url = "/vote/deleteVote";
         } else if ($(this).attr("value") == "false") {
            url = "/vote/insertVote";
         }
    alert("url = "+url);
         console.log(url);
         $.ajax({
            url : url,
            data : {'user_num':user_num, 'product_no':product_no},
            type: 'POST',
            success : function(result) {
               console.log(result);
               $(target).attr("value", result);
               if(result == "true") {
                  $(target).find(".like").attr("src", "/img/product/like.png");   
               } else {
                  $(target).find(".like").attr("src", "/img/product/unlike.png");
               }
            }
         }); // ajax

      }); // end 좋아요
   $(".bucket").click(function(){
		var id = "${check}";
		var auth = "${auth}";
	
	//버튼 : 장바구니,바로결제
		if(id != '' && auth == "customer"){
			 location.href = '/member/cartList';
		}else if(id != '' && auth == "seller"){ 	 
			 alert("일반회원만 사용 가능합니다.");
			 return false;
			 
		}else if(id != '' && auth == "admin"){ 	 
			 alert("일반회원만 사용 가능합니다.");
			 return false;
			 
		}else{
			 alert("로그인 후 사용 가능합니다.");
       	 location.href = '/member/login';
		}
	});
   $(".pay").click(function(){
		var id = "${check}";
		var auth = "${auth}";
		
		if(id != '' && auth == "customer"){
			 location.href = '/member/cartList';
		}else if(id != '' && auth == "seller"){ 	 
			 alert("일반회원만 사용 가능합니다.");
			 return false;
			 
		}else if(id != '' && auth == "admin"){ 	 
			 alert("일반회원만 사용 가능합니다.");
			 return false;
			 
		}else{
			 alert("로그인 후 사용 가능합니다.");
      	 location.href = '/member/login';
		}
	});
   //main 이미지
   document.querySelectorAll(".sub-img").forEach(function(e){
       e.addEventListener("click",function(){
          document.querySelector("#product-img").setAttribute("src",this.getAttribute("src"))
       });
	});
   
});//function 끝

</script>

<body>
<jsp:include page="../template/header.jsp"></jsp:include>
<div class="detail-all">
   <input type="hidden" name="user_num" value="${check}">
   <input type="hidden" name="product_no" value="${product.product_no}">
      <form:form modelAttribute="getDetail">
      
         <div class="main-img">
            <div class="product-img">
               <img src="https://placeimg.com/445/430/tech" id="product-img">
            </div>
            
            <div class="product-subimg" align="center">
               <img src="https://placeimg.com/58/58/tech" class="sub-img">
               <img src="https://placeimg.com/58/58/animals" class="sub-img">
               <img src="https://placeimg.com/58/58/tech" class="sub-img">
               <img src="https://placeimg.com/58/58/animals" class="sub-img">
               <img src="https://placeimg.com/58/58/tech" class="sub-img">
            </div>
         </div><!--main-img  -->
         
         <div class="main-info">
                   <input type="button" class="brand"  value="브랜드 둘러보러가기 >" onclick="location.href='해당브랜드.jsp';">
                  <div>
                     <span>상품이름</span>
                     <span>${getDetail.product_name} </span>
                  </div>

                  <div>
                     <span>상품가격</span>
                     <span>${getDetail.product_price}원 </span>
                  </div>

                  <div>
                     <span>배송정보</span>
                     <span>일반배송 | 3,000원 (15,000 원 이상 무료배송 )</span>
                  </div>
                  
                  <div>
                  <form name="form" method="get">
                     <span>상품 수량</span>
                     <input type="hidden" id="sell_price" name="sell_price" value="${getDetail.product_price}">

                     <input type="number" style="height: 23pt;width : 120px;"value="1" min="1" max="100" onchange="change();" id="result" name="amount" >
                     <input type="button" style="height: 23pt;width : 24px;" value=" + " id="plus">
                     <input type="button" style="height: 23pt;width : 25px;" value=" - " id="minus">
                     
                     <br>
                     
                     <span>합계금액</span>
                     <input type="text" style="font-size : 23px; width : 181px;" name="sum" size="11" readonly id="total_amount" value="${getDetail.product_price }">원
                  </form>
                 </div>
                 
                 <div class="btn"> 
                     <input type="button" value="장바구니" class="bucket">
                     <input type="button" value="바로 구매" class="pay">
                  
                     <button class="nice" id="nice" value="false">
                           <img src="/img/product/unlike.png" id="vote_img" style="width:40px; heigth:35px; " alt="좋아요" class="like">
                     </button>
               </div>
            
         </div><!-- class="main-info" -->
      </form:form>   
</div>

   <div class="recommend">
      <span style="font-family :sans-serif; font-size : 18px;">이런 상품은 어떠세요?</span>
         <div class="slide">
          <input type="radio" name="pos" id="pos1" checked>
          <input type="radio" name="pos" id="pos2">
          <input type="radio" name="pos" id="pos3">
          <input type="radio" name="pos" id="pos4">
          <ul>
            <li>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
            </li>
            <li>
               <a href="#">
                  <img src="https://placeimg.com/270/125/tech">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/tech">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/tech">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/tech">
               </a>
            </li>
            <li>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/animals">
               </a>
            </li>
            <li>
               <a href="#">
                  <img src="https://placeimg.com/270/125/tech">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/tech">
               </a>
               <a href="#">
                  <img src="https://placeimg.com/270/125/tech">
               </a>
            </li>
          </ul>
          <p class="bullet">
            <label for="pos1">1</label>
            <label for="pos2">2</label>
            <label for="pos3">3</label>
            <label for="pos4">4</label>
          </p>
        </div>
   </div><!-- recommend 끝 -->
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>