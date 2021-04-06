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
      background-color: #DAO641;
      color:white;
         font-size: 18px;
   }
   .btn_bucket{
      background-color: #DAO641;
      color:white;
         font-size: 18px;
   }
</style>
<!--  -->
<body>
<script>

function numcheck(val,jaego){
                      if (val>jaego-1){
                              alert("재고량이 없습니다")
                              document.frm.ea.value=jaego}
                      else if (val<2){
                              document.frm.ea.value=1        }
      }
function up(val,jaego){
                      if (val>jaego-1){
                              alert("재고량이 없습니다")
                              document.frm.ea.value=jaego}
                      else{
                              document.frm.ea.value=(val/1)+1}
}
                                                       
function down(val){
                      if (val<2){
                              document.frm.ea.value=1}
                      else{
                              document.frm.ea.value=val-1}
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
                  <table class="table_first" >
                     <tr>
                        <th align="left" width="100px;">구매 수량</th>
                        
                        <td>
                        <input type="text" name="ea" class="form" size="2" value="1" 
                        maxlength="2" onblur="numcheck(this.form.ea.value,10)" 
                        onkeyup="if(isNaN(this.value)) {alert('숫자만 입력해 주세요.');this.value=''};">
                        </td>      
                        <td valign="middle"height="25">
                           <input type="button" value="▲" onclick="up(this.form.ea.value,10)" 
                           style="background-color:white;border:0; height:10px;;font-size:12px" name="plus">
                           <br>
                           <input type="button" value="▼" onclick="down(this.form.ea.value)" 
                           style="background-color:white;border:0; height:10px;font-size:12px" name="minus">                  
                        </td>                  
                     </tr>
                     
                     <tr>
                        <th align="left" width="100px;">합계 금액</th>
                        <td align="center">1</td>
                     </tr>
                                          
                  </table>
                  
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
      
      <div>
         <h1>추천상품</h1>
      <!-- 중단 추천상품목록 -->
      </div>
      
      <div>
         <h1>상품내용</h1>
      <!-- 상품내용/구성/배송/qna 메뉴 -->
      </div>
   </div>
</body>
</html>