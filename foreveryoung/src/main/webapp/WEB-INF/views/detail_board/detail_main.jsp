<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
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
      font-family: sans-serif;
      font-size: 30px;
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
        width : 1100px;
        margin : 0 auto;
    	margin-top : 5px;
    	margin-bottom : 5px;
   }   
   #pack-list{
		color : #74DF00;
		font-family : Sans-Serif;
		font-size : 28px;
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
                  <td colspan="2">상품이름(product_name)을 가져오시오.</td>
               </tr>
               <tr>
                  <th>상품가격</th>
                  <td colspan="2">상품가격(product_price)을 가져오시오.</td>
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
                  <input type=hidden name="sell_price" value="5500">
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
               <input type="button" value="좋아요" class="nice" onclick="location.href='현재페이지.jsp';">
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
	   		<span id="pack-list">배송비/배송가능일</span>
	   		<table style="border : 1px brown solid;">
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
	   		<span id="pack-list">교환/반품/환불 안내</span>
	   		<table style="border : 1px brown solid;">
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
	   				
	   				</th>
	   				<td width="750px;">
	   				
	   				</td>
	   			<tr style=" width : 1100px;">
	   				<th width="350px;" style="background-color : #CEF6E3;">
	   				
	   				</th>
	   				<td width="750px;">
	   				
	   				</td>
	   			</tr>
	   		</table>	   		
	   </div>
	   
	   <div class="review">
	   3
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
</script>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>