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
   height : 750px;
}
.main-img{
   border : 2px red solid;
   float:left;
   width : 38%;
   height : 500px;
}
.main-info{
   border : 2px solid green;
   float : right;
   width : 60%;
   height : 500px;
}
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



});
</script>

<body>
<jsp:include page="../template/header.jsp"></jsp:include>
<div class="detail-all">
      <form:form modelAttribute="getDetail">
      
         <div class="main-img">
            <p><form:input path="product_no" readonly="true"/></p>
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
                     <input type="text" style="font-size : 23px; width : 181px;" name="sum" size="11" readonly id="total_amount">원
                  </form>
                 </div>
                 
                 <div class="btn"> 
                     <input type="button" value="장바구니" class="bucket" onclick="location.href='장바구니.jsp';">
                     <input type="button" value="바로 구매" class="pay" onclick="location.href='결재.jsp';">
                  
                     <button class="nice" id="nice" value="false">
                           <img src="/img/product/unlike.png" id="vote_img" style="width:40px; heigth:35px; " alt="좋아요" class="like">
                     </button>
               </div>
            
         </div><!-- class="main-info" -->
      </form:form>   
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>