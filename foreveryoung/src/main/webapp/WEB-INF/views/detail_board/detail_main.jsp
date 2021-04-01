<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
   .test{
      border: 1px solid black;
   }
   .first{
      display: flex;
      border: 3px solid gold;
      margin-left : 20%;
      margin-right: 20%;
      padding : 0px;
      widht: 1200px;
      heihg:600px;
   }
   .box{
      justify-content:center;
   }
   .button_brand{
      background-color:white;
      font-size:20px;
      padding : 2px;
      border-radius: 5px;
      border: 1px solid black;
      font-family: Georgia, "Malgun Gothic", serif;
   }
   .table_first{
      margin : 10px;
      width : 380px;
   }
   .btn_pay{
      background-color: #FF4500;
      color:white;
      font-size: 38px;
      border :none;
   }
   .btn_bucket{
      background-color: #DAO641;
      color:black;
         font-size: 38px;
   }
   .first_s{
      margin-left : 10%;
      margin-right: 10%;
      font-size : 25px;
   }
   .recommend{
   	height : 300px;
   }
</style>
<!--  -->
<body>
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
</script>
   <div>
      <div class=test>
      <!-- 상단 상품정보 -->
         <div class=first>
            <img class=box src="http://via.placeholder.com/" width=400 height=500 style="padding-top:10px; padding-left : 10px;">
            
            <div>
               <div class=box>
                  <table class="table_first" border="1">
                     <tr>
                        <th align="left" colspan="2">
                           <input type="button" value="브랜드 둘러보기 " class="button_brand" onclick="location.href='브랜드관.jpg'">
                        </th>
                     </tr>
                     
                     <tr>
                        <th align="left" style="font-size : 3rem" colspan="2"> 제품명<!-- ${product.product_name} --></th>                     
                     </tr>
                     
                     <tr>
                        <td>제품 가격</td>
                        <td>1000<td>
                     </tr>
                     
                     <tr>
                        <th align="left" colspan="2">배송정보</th>
                     </tr>
                     
                     <tr>
                        <td>일반배송</td>
                        <td style="font-size : 15px">|2500원(20,000원 이상 무료배송)</td>
                     </tr>
                     
                     <tr>
                        <th></th>
                        <td align="left">평균3~5일 이내 배송</td>
                     </tr>                     
                  </table>
                  
                  <hr>
                  
                  <!-- 구매수량 합계금액 -->
                  <div class="first_s">
					<form name="form" method="get">
						<div>수량 </div>
						<div>
							<input type=hidden name="sell_price" value="5500">
							<input type="text" name="amount" value="1" size="3" onchange="change();">
							<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">
						</div>
						
						<div>금액</div>
						
						<div>
							<input type="text" name="sum" size="11" readonly>원
						</div>
					</form>
                  </div>
                  
                  <hr>
                  
                  <table class="table_first">
                     <tr>
                        <td align="right">
                           <input type="button" class="btn_pay" value="바로구매" onclick="location.href='결재페이지.jpg'">
                        </td>      
                        <td>
                           <input type="button" class="btn_bucket" value="장바구니"  onclick="location.href='장바구니페이지.jpg'">      
                        </td>               
                     </tr>                  
                  </table>
               </div>
            </div>
         </div>
      </div>
      
      <div align="center" class="recommend">
         <h1 align="left">추천상품</h1>
         	<div class="swiper-slide">
				<input type="radio" name="pos" id="pos1" checked>
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
		      	<input type="radio" name="pos" id="pos2">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
		      	<input type="radio" name="pos" id="pos3">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
		      	<input type="radio" name="pos" id="pos4">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
			      <img class="swiper-slide" src="https://placeimg.com/350/200/tech">
		     </div>
      </div>
      
      <hr>
      
      <div>
         <h1>상품내용</h1>
      <!-- 상품내용/구성/배송/qna 메뉴 -->
      </div>
   </div>
</body>
</html>