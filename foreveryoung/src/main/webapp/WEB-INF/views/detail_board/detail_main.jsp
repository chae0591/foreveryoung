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
.reco-img{
	cursor : pointer;
}
.bar{
	border: 3px solid purple;
	width : 1200px;
	height : 50px;
	maring-right : 20%;
	margin-left : 20%;	
}
.bar>ul>li{
	font-size : 21px;
	text-align : center;
	font-family : sans-serif;
	margin : 5px;	
    position:relative;
    height:100%;
    width:23%;
    float:left;
    color : black;
    font-weight :bold;
    text-shadow:0 1px 1px rgba(0,0,0,0.3);
    cursor:pointer;
}
.bar>ul>li:hover{
	color : #E6F8E0;
	font-weight :bold;
	text-shadow:0 1px 1px rgba(0,0,0,0.3);
}
.detail{
	border: 3px solid greenyellow;
	width : 1200px;
	maring-right : 20%;
	margin-left : 20%;	
	position:relative;
}
#review_btn{
	background-color : #CEF6E3;
	font-family : sans-serif;
	font-size : 27px;
	border : none;
    border-top-left-radius:5px;
    border-top-right-radius:5px;
    border-bottom-left-radius:5px;
    border-bottom-right-radius:5px;
	position : relative;
	cursor:pointer;
}
#review_btn:hover{
	color : ivory;
}
.review{
	font-size : 19px;
	font-family : sans-serif;
	width : 1195px;
}
.review-unit{
	display:flex;
	height : 37px;
	padding :5px;
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
   //main 이미지 바꾸기 기증
   document.querySelectorAll(".sub-img").forEach(function(e){
       e.addEventListener("click",function(){
          document.querySelector("#product-img").setAttribute("src",this.getAttribute("src"))
       });
	});
   
   //추천 reco-img 링크연결
   document.querySelectorAll(".reco-img").forEach(function(e){
       e.addEventListener("click",function(){
          document.querySelector("#product-img").setAttribute("a",this.getAttribute("a"))
          <!-- 해당 product_no 로 이동-->
       });
 });   
   //menu-bar 클릭 기능
   $(function(){
       $(".bar-list").eq(0).show(function(){
         $(".detail").children("div").hide();
         $(".product-detail").show();
       });
       
     $(".bar-list").eq(0).click(function(){
      $(".detail").children("div").hide();
        $(".product-detail").show();
     });
     $(".bar-list").eq(1).click(function(){
       $(".detail").children("div").hide();
        $(".purchas-detail").show();
     });
     $(".bar-list").eq(2).click(function(){
       $(".detail").children("div").hide();
        $(".review").show();
     });
     $(".bar-list").eq(3).click(function(){
       $(".detail").children("div").hide();
        $(".qna").show();
     });
});//menu 끝   

//최신순,인기순 등 review-unit 적용
	$(function(){
		$(".order-list").eq(0).click(function(){
			$.ajax({
				type : "POST",
				url : '/detail_board/recent',
				contentType : 'application/json',
				data : jsonData,
				
			});//ajax 끝
		});//최신순 끝
	});
//리뷰 버튼-작성
	$(function(){
		$("#review_btn").click(function(){
			var id = "${check}";
			
	        if(id == ''){
	        	 alert("로그인 후 리뷰작성이 가능합니다.");
	        	 location.href = '/member/login';
	   		 }else{
	   			 var product_no_val = $("input[name=product_no]").val();
	   			 location.href = '/detail_board/reviewRegister?product_no=' + product_no_val;
	    	}
		});
	});//리뷰버튼-작성 끝
	
//리뷰 버튼-수정
	$(function(){
		$(".review-modify").click(function(){
			var id = "${check}";

	        if(id == ''){
	        	 alert("로그인 후 리뷰작성이 가능합니다.");
	        	 location.href = '/member/login';
	   		 }else{
	   			 var review_num_val = $("input[name=review_num]").val();
	   			 location.href = '/detail_board/reviewModify?review_num=' + this.id;
	    	}
		});
	});
//리뷰 버튼-삭제
	
});//function 끝

</script>

<body>
<jsp:include page="../template/header.jsp"></jsp:include>
<div class="detail-all">
   <input type="hidden" name="user_num" value="${check}">
   <input type="hidden" name="product_no" value="${getDetail.product_no}">
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
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
         </li>
         <li>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
            </a>
         </li>
         <li>
            <a href="#">
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/animals" class="reco-img">
            </a>
         </li>
         <li>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
            </a>
            <a href="#">
               <img src="https://placeimg.com/270/125/tech" class="reco-img">
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
   
<div class="bar">
 <ul style="list-style-type:none">
    <li style="display:inline" class="bar-list">
          상품설명
    </li>
   
    <li style="display:inline" class="bar-list">
          구매정보
    </li>
    
    <li style="display:inline" class="bar-list">
          리뷰
    </li>
      
    <li style="display:inline" class="bar-list">
          QnA
    </li>
 </ul>   
</div><!-- menu 끝 -->
   
<div class="detail">
   <div class="product-detail">
   "${prodcut.prodcut_img}"
   </div>
      
   <div class="purchas-detail">
      <div style="padding-top:50px;">
         <span id="pack-list">배송비/배송가능일</span>
         <table id="change-table">
            <tr style=" width : 1100px;">
               <th width="350px;" style="background-color : #CEF6E3;">배송비/배송가능일</th>
               <td width="750px;">
               [일반 배송]<br>
            배송지역 : 전국<br>
            배송비 : 2,500원<br>
            올리브영 배송 상품의 총 결제금액 20,000원 이상일 경우 무료배송 됩니다.<br>
            도서, 산간, 오지 일부 지역은 배송비가 추가될 수 있습니다.<br>
            배송가능일 : 3일<br>
            배송가능일이란 본 상품을 주문하신 고객님들께 상품 배송이 가능한 기간을 의미합니다. 단, 연휴 및 공휴일은 기간 계산시 제외하며 현금 주문일 경우 입금일 기준 입니다.<br>
            예약 상품의 경우 예약된 날짜에 출고되며, 상품의 입고가 빠르게 진행된 경우 예약일 보다 일찍 배송될 수 있습니다.<br>
               </td>
            </tr>
         </table>
         </div>
         <div style="padding-top:50px">
         <span id="pack-list">교환/반품/환불 안내</span>
         <table id="change-table">
            <tr style=" width : 1100px;">
               <th width="350px;" style="background-color : #CEF6E3;">
               교환/반품 신청 방법
               </th>
               <td width="750px;">
               마이페이지 내 주문내역에서 신청가능하며,<br>
               반품 신청의 경우 택배회수 / 매장방문(일부 매장)중 선택하여 신청가능합니다.
               </td>
            </tr>
            <tr style=" width : 1100px;">
               <th width="350px;" style="background-color : #CEF6E3;">
                  교환/반품 신청 기간
               </th>
               <td width="750px;">
                교환, 반품 신청은 배송이 완료된 후 15일 이내 가능합니다.<br>
               고객님이 배송 받으신 상품의 내용이 표시∙광고의 내용과 다르거나 계약내용과 다르게 이행된 경우에는 배송 받으신 날로부터 3개월 이내, 혹은 그 사실을 알 수 있었던 날로 부터 30일 이내에 가능합니다.
               </td>
               <tr style=" width : 1100px;">
                  <th width="350px;" style="background-color : #CEF6E3;">
                     교환/반품/회수 비용
                  </th>
               <td width="750px;">
                  <span style="font-weight : bold">[택배 회수 반품]</span><br>
                  <br>
               고객님의 사유에 의한 교환 및 반품은 회수 및 배송에 필요한 비용을 부담해주셔야 합니다.<br>
               기본 비용은 교환 5,000원(회수비+배송비), 반품 2,500원(회수비)입니다.<br>
               제주도 및 도서산간 지방에는 추가 운임이 발생합니다.<br>
               당사의 사유(상품의 하자, 배송의 오류 등)로 인한 경우 교환 및 반품에 필요한 비용은 당사에서 부담합니다.<br>
                  <br>
                  <span style="font-weight : bold">[매장 방문 반품]</span><br>
               올리브영 일반 주문 Green Olive 이상 등급 또는 오늘드림 주문에 한해서 별도 회수비 부담없이 반품 가능합니다.(단, 일부 매장만 가능)<br>                  
                  </td>
               <tr style=" width : 1100px;">
                  <th width="350px;" style="background-color : #CEF6E3;">
                     교환/반품 불가안내
                  </th>
                  <td width="750px;">
                  고객님의 사유에 의한 교환 및 반품이 불가한 경우<br>
                  1. 배송이 완료된 후 15일이 경과한 경우<br>
                  2. 포장 훼손 및 사용 또는 일부 소비, 구성품 누락 및 상품의 결함 발생으로 인해 상품의 가치가 훼손된 경우<br>
                  <br>
                  당사의 사유에 의한 교환 및 반품이 불가한 경우<br>
                  1. 배송 받으신 날로부터 3개월, 혹은 그 사실을 알 수 있었던 날로 부터 30일이 경과한 경우<br>
                  2. 당사의 귀책(상품의 불량, 생산 및 제조 및 배송 간의 파손 등)으로 인한 현상이 아닌 해당 상품의 고유한 특성, 혹은 상품 수령 후 고객님의 과실로 인한 문제임이 규명된 경우<br>
                  </td>
               </tr>
         </table>
         </div>            
	</div>
      
	<div class="review">
		<input type="button" value="리뷰작성" id="review_btn" style="float : right">
		<div class="review-unit" style="display:flex; height : 37px; padding :5px;" >
			<div style="margin-right : 13px;">
		        <span class="order-list">최신순 |</span>
		        <span class="order-list">오래된순 |</span>
		        <span class="order-list">평점 높은순 |</span>
		        <span class="order-list">평점 낮은순 |</span>				
			</div>
	        <div>
				<input type="radio" name="order" value="포토리뷰" checked="checked">포토리뷰
				<input type="radio" name="order" value="일반리뷰">일반리뷰
	        </div>
	    </div>    
    
         <hr>
            
            <div class="review_filt">
               <ul>
               <c:forEach var = "lists" items="${reviewList}">
                  <li><span>아이디   </span>${lists.user_num}</li>
                  <li><span>등록일   </span>${lists.review_date}</li>
                  <li><span>리뷰 점수   </span>${lists.review_score}</li>
                  <li><span>제목   </span>${lists.review_title}</li>
                  <li><span>내용   </span>${lists.review_content}</li>
                  <li>내용</li>
                  <li>사진</li>
                  <li>
                  	<button class="review-delete" id="${lists.review_num}">삭제</button>
                  	<button class="review-modify" id="${lists.review_num}">수정</button>
                  </li>
                  <li>
                     <button>리뷰 좋아요</button>
                     <button>신고하기</button>
                  </li>
               </c:forEach>
               </ul>
            </div>
      </div>
      
      <div class="qna">
      4
      </div>
   </div>   <!-- 상세정보 끝 -->
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>