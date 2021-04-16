<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>

<style>
   .product{
      margin : 0 auto;
      height: 520px;
      width : 1100px;
      border: 3px solid black;
      position : relative;
      padding : 5px;
      padding-top : 5px;
   }
   .information{
        border : 2px solid green;
        float : right;
        width : 60%;
        height : 500px;
   }
   .main-img{
   border : 2px solid blue;
   float:left;
   width : 38%
   }
   #product-img{
      width :400px;
      height:430px;
   }
   .prodcut-table{
        padding-top : 3px;
      float : right;
      height : 430px;
      border: 3px solid red;
      font-size : 28px;
      font-family: sans-serif;
      padding : 10px;
   }
   .brand{
      border: 1px solid #2AC30B;
      font-family: sans-serif;
      border-top-left-radius:5px;
      border-top-right-radius:5px;
      border-bottom-left-radius:5px;
      border-bottom-right-radius:5px;
      float : left;
      
      font-size : 22px;
      background : none;
   }
   .btn{
      float : right;
      width : 60%;
      padding-top : 10px;
      border-top : 1px solid black;
   }
   .bucket{
      border-color: #FF0040;
      border-top-left-radius:5px;
      border-top-right-radius:5px;
      font-family: sans-serif;
      font-size: 30px;
      color : #FF0040;
      background : none;   
   }
   .nice{
      border-top-left-radius:5px;
      border-top-right-radius:5px;
   }
   .pay{
      border-color: white;
      border-top-left-radius:5px;
      border-top-right-radius:5px;
      font-family: sans-serif;
      font-size: 30px;
      color : white;
      background : #FF0040;         
   }
   .recommend{
     margin : 0 auto;
     margin-top : 5px;
     border : 3px solid aqua;
     width : 1100px;
     height : 187px;
     position : relative;
      padding : 5px;
      padding-top : 5px;      
   }
   .menu{
        border: 3px solid red;
        width : 1100px;
        height : 50px;
        margin : 0 auto;
     margin-top : 5px;
     background : #81F781;
   }
   .menu>ul,li{
         font-size : 21px;
         text-align : center;
         font-family : sans-serif;
         padding : 5px;
   }
   .menu>ul{
         width:100%;
      position:relative;
      list-style:none;
   }
   .menu>ul>li{
         position:relative;
      height:100%;
      width:23%;
      float:left;
      color : black;
      font-weight :bold;
      text-shadow:0 1px 1px rgba(0,0,0,0.3);
   }
   .menu>ul>li:hover a{
      color : #E6F8E0;
      font-weight :bold;
      text-shadow:0 1px 1px rgba(0,0,0,0.3);
   }
   a { text-decoration:none }
   
   .detail{
        border: 3px solid purple;
        height : auto;
        width : 1100px;
        margin : 0 auto;
       margin-top : 5px;
       margin-bottom : 5px;
   }   
   #pack-list{
      color : #74DF00;
      font-family : Sans-Serif;
      font-size : 18px;
      font-weight : bold;
      margin-top : 13px;
   }
   #change-table{
      border-top: 1px solid #444444;
      border-collapse: collapse;
   }
   #change-table>tr,th,td{
       border-bottom: 1px solid #444444;
   }
   .review{
      padding-right : 5px;
      padding-left : 5px;
   }
   .review_filt{
   	list-style : none;
   }
       *{margin:0;padding:0;}
          ul,li{list-style:none;}
          .slide{height:150px;overflow:hidden;position:relative;}
          .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;transition:1s;}
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
<body>
<jsp:include page="../template/header.jsp"></jsp:include>
   <div class="product">
   <input type="hidden" name="user_num" value="${check}">
   <input type="hidden" name="product_no" value="${product.product_no}">
   
         <div class="main-img">
            <div class="product-img">
               <img src="https://placeimg.com/400/430/tech" id="product-img">
            </div>
            
            <div class="product-subimg" align="center">
               <img src="https://placeimg.com/58/58/tech" class="sub-img">
               <img src="https://placeimg.com/58/58/animals" class="sub-img">
               <img src="https://placeimg.com/58/58/tech" class="sub-img">
               <img src="https://placeimg.com/58/58/animals" class="sub-img">
               <img src="https://placeimg.com/58/58/tech" class="sub-img">
            </div>
         </div>

         <div class="information">
            <table class="prodcut-table">
               <tr>
                  <th colspan="3">
                     <input class="brand" type="button" value="브랜드 둘러보러가기 >" onclick="location.href='해당브랜드.jsp';">
                  </th>
               </tr>
               <tr>
                  <th>상품이름</th>
                  <td colspan="2">${product.product_name} </td>
               </tr>
               <tr>
                  <th>상품가격</th>
                  <td colspan="2">${product.product_price}원</td>
               </tr>
               <tr>
                  <th>배송정보</th>
                  <td colspan="2"> </td>
               </tr>
               <tr style="font-size : 21px; ">
                  <th colspan="3" style="text-align:left"> 일반배송 | 3,000원 (15,000 원 이상 무료배송 )</th>
               </tr>
               <form name="form" method="get">
               <tr>
                  <th>상품 수량</th>
                  <td colspan="2">
                  <input type=hidden name="sell_price" value="${product.product_price}">
                  <input type="number" style="font-size : 23px; width : 71px;"name="amount" value="1" size="3" onchange="change();">
               <input type="button" style="HEIGHT: 23pt;width : 24px;" value=" + " onclick="add();"><input type="button" style="HEIGHT: 23pt;width : 25px;" value=" - " onclick="del();">
                  </td>
               </tr>
               
               <tr>
                  <th>합계금액</th>
                  <td colspan="2"><input type="text" style="font-size : 23px; width : 181px;" name="sum" size="11" readonly>원</td>
               </tr>
               </form>
            </table>
            
              <div class="btn"> 
               <input type="button" value="장바구니" class="bucket" onclick="location.href='장바구니.jsp';">
               <input type="button" value="바로 구매" class="pay" onclick="location.href='결재.jsp';">
               
               <button class="nice" value="">
                     <img src="/img/product/unlike.png" id="vote_img" style="width:40px; heigth:35px; " alt="좋아요" class="like">
               </button>
            </div>
            
         </div>
   </div>
   
   <div class="recommend">
      <span style="font-family :sans-serif; font-size : 18px;">이런 상품은 어떠세요?</span>
           <div class="slide">
          <input type="radio" name="pos" id="pos1" checked>
          <input type="radio" name="pos" id="pos2">
          <input type="radio" name="pos" id="pos3">
          <input type="radio" name="pos" id="pos4">
          <ul align="center">
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
   </div>
   
   <div class="menu">
   <ul style="list-style-type:none">
      <li style="display:inline" class="menu-list">
         <a href="#">
            상품설명
         </a>
      </li>
      
      <li style="display:inline" class="menu-list">
         <a href="#">
            구매정보
         </a>
      </li>
      
      <li style="display:inline" class="menu-list">
         <a href="#">
            리뷰
         </a>
      </li>
      
      <li style="display:inline" class="menu-list">
         <a href="#">
            Q&A
         </a>
      </li>
   </ul>   
   </div>
   
   <div class="detail">
      <div class="product-detail">
      1
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
         <input type="button" value="리뷰작성">
         <hr>
            <div>
               <div>
                  <span>최신순</span>
                  <span>오래된순</span>
                  <span>평점 높은순</span>
                  <span>평점 낮은순</span>
               </div>
               
               <div>
               <input type="radio" name="order" value="포토리뷰" checked="checked">포토리뷰
               <input type="radio" name="order" value="일반리뷰">일반리뷰
               </div>
            </div>
            
            <div class="review_filt">
            
               <ul>
               <c:forEach var = "lists" items="${list}">
                  <li>${list.review_title}</li>
                  <li>${list.review_content}</li>
                  <li>${list.review_date}</li>
                  <li>${list.review_score}</li>
                </c:forEach>
               </ul>

               <ul>
                  <li>내용</li>
                  <li>사진</li>
                  <li>
                  	<button>리뷰 좋아요</button>
                  	<button>신고하기</button>
                  </li>
               </ul>
            </div>
      </div>
      
      <div class="qna">
      4
      </div>
   </div>   
<script>   
   var sell_price;
   var amount;
   
   function init () {
      sell_price = document.form.sell_price.value;
      amount = document.form.amount.value;
      document.form.sum.value = sell_price;
      change();
   }
   init();
   function add () {
      hm = document.form.amount;
      sum = document.form.sum;
      hm.value ++ ;
   
      sum.value = parseInt(hm.value) * sell_price;
   }
   
   function del () {
      hm = document.form.amount;
      sum = document.form.sum;
         if (hm.value > 1) {
            hm.value -- ;
            sum.value = parseInt(hm.value) * sell_price;
         }
   }
   
   function change () {
      hm = document.form.amount;
      sum = document.form.sum;
   
         if (hm.value < 0) {
            hm.value = 0;
         }
      sum.value = parseInt(hm.value) * sell_price;
   }  
   
   document.querySelectorAll(".sub-img").forEach(function(e){
         e.addEventListener("click",function(){
            document.querySelector("#product-img").setAttribute("src",this.getAttribute("src"))
         });
   });
   
   $(function(){
           $(".menu-list").eq(0).show(function(){
             $(".detail").children("div").hide();
             $(".product-detail").show();
           });
           
         $(".menu-list").eq(0).click(function(){
          $(".detail").children("div").hide();
            $(".product-detail").show();
         });
         $(".menu-list").eq(1).click(function(){
           $(".detail").children("div").hide();
            $(".purchas-detail").show();
         });
         $(".menu-list").eq(2).click(function(){
           $(".detail").children("div").hide();
            $(".review").show();
         });
         $(".menu-list").eq(3).click(function(){
           $(".detail").children("div").hide();
            $(".qna").show();
         });
   });
//user_num 좋아요 가져오기
	$(document).ready(function(){
		var user_num = $("input[name='user_num']").val();
		var product_no = $("input[name='product_no']").val();
		
		if(user_num != "") {
			voteCheck();
		}
		function voteCheck(){
			if(user_num==""){
				return false;
			}else{
				$.ajax({
					url : '/vote/checkVote',
					type : 'GET',
					data : {
						'user_num' : user_num,
						'product_no' : product_no
					},
					success : function(result){
						console.log(result);
						if(result=="yes"){	
							$("#vote_img").attr("src","/img/product/like.png")
							$(".nice").attr("value", "true")
						}else{
							$("#vote_img").attr("src","/img/product/unlike.png")
							$(".nice").attr("value", "false")
						}
					}
				});
			}
		}
//좋아요 기능 실행		
		$(document).on('click', '.nice', function(){
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
			console.log(url);
			
			$.ajax({
				url : url,
				data : {'user_num':user_num, 'product_no':product_no},
				type: 'POST',
				success : function(result) {
					console.log(result)
					$(target).attr("value", result);
					if(result == "true") {
						$(target).find(".like").attr("src", "/img/product/like.png");	
					} else {
						$(target).find(".like").attr("src", "/img/product/unlike.png");
					}
				}
			}); // ajax
		}); // end 좋아요
	})
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>