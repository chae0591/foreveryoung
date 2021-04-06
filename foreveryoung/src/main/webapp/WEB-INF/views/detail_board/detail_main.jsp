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
   
       *{margin:0;padding:0;}
		    ul,li{list-style:none;}
		    .slide{height:155px;overflow:hidden;position:relative;}
		    .slide ul{width:calc(100% * 4);display:flex;transition:1s;}
		    .slide li{width:calc(100% / 4);height:300px;}
		    .slide input{display:none;}
		    .slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
		    .slide .bullet label{width:10px;height:10px;border-radius:10px;border:2px solid #666;display:inline-block;background:#fff;font-size:0;transition:0.5s;cursor:pointer;}
		    /* �����̵� ���� */
		    #pos1:checked ~ ul{margin-left:0;}
		    #pos2:checked ~ ul{margin-left:-100%;}
		    #pos3:checked ~ ul{margin-left:-200%;}
		    #pos4:checked ~ ul{margin-left:-300%;}
		    /* bullet ���� */
		    #pos1:checked ~ .bullet label:nth-child(1),
		    #pos2:checked ~ .bullet label:nth-child(2),
		    #pos3:checked ~ .bullet label:nth-child(3),
		    #pos4:checked ~ .bullet label:nth-child(4){background:#666;}
	        .menu,
        .menu ul {
            list-style: none;
            margin:0;
            padding:0;
        }
        /* �޴� �׵θ� */
        .menu {
            border:1px solid black;
        }
        /* 1�� �޴� �׸� */
        .menu > li {
            width:150px;
            display:inline-block;
            position:relative;/*relative�� ������ absolute�� ���д�*/
            padding:1rem;
        }
        /* 2�� �̻� �޴� */
        .menu ul {
            display:none;
            position:absolute;
            top:55px;
            left:0;
        }
        .menu ul > li {
            background-color:gray;
            width:150px;
            padding:1rem;            
        }
        .menu ul > li:hover {
            background-color:black;
        }
        .menu ul > li:hover > a {
            color:white;
        }
        
        /* ��ü �޴��� ���콺�� �ö� ����� ���� �޴� */
        .menu li:hover > ul {
            display:block;
        }
        /* �޴��� �ִ� ��ũ ��ü */
        .menu a {
            text-decoration: none;
            color:black;
        }
  </style>
  
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
      <!-- ��� ��ǰ���� -->
         <div class=first>
            <img class=box src="http://via.placeholder.com/" width=400 height=500 style="padding-top:10px; padding-left : 10px;">
            
            <div>
               <div class=box>
                  <table class="table_first" border="1">
                     <tr>
                        <th align="left" colspan="2">
                           <input type="button" value="�귣�� �ѷ����� " class="button_brand" onclick="location.href='�귣���.jpg'">
                        </th>
                     </tr>
                     
                     <tr>
                        <th align="left" style="font-size : 3rem" colspan="2"> ��ǰ��<!-- ${product.product_name} --></th>                     
                     </tr>
                     
                     <tr>
                        <td>��ǰ ����</td>
                        <td>1000<td>
                     </tr>
                     
                     <tr>
                        <th align="left" colspan="2">�������</th>
                     </tr>
                     
                     <tr>
                        <td>�Ϲݹ��</td>
                        <td style="font-size : 15px">|2500��(20,000�� �̻� ������)</td>
                     </tr>
                     
                     <tr>
                        <th></th>
                        <td align="left">���3~5�� �̳� ���</td>
                     </tr>                     
                  </table>
                  
                  <hr>
                  
                  <!-- ���ż��� �հ�ݾ� -->
                  <div class="first_s">
					<form name="form" method="get">
						<div>���� </div>
						<div>
							<input type=hidden name="sell_price" value="5500">
							<input type="text" name="amount" value="1" size="3" onchange="change();">
							<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();">
						</div>
						
						<div>�ݾ�</div>
						
						<div>
							<input type="text" name="sum" size="11" readonly>��
						</div>
					</form>
                  </div>
                  
                  <hr>
                  
                  <table class="table_first">
                     <tr>
                        <td align="right">
                           <input type="button" class="btn_pay" value="�ٷα���" onclick="location.href='����������.jpg'">
                        </td>      
                        <td>
                           <input type="button" class="btn_bucket" value="��ٱ���"  onclick="location.href='��ٱ���������.jpg'">      
                        </td>               
                     </tr>                  
                  </table>
               </div>
            </div>
         </div>
      </div>
      
      <div align="center" class="recommend">
         <h3 align="center">��õ��ǰ</h3>
         
			<div class="slide">
			    <input type="radio" name="pos" id="pos1" checked>
			    <input type="radio" name="pos" id="pos2">
			    <input type="radio" name="pos" id="pos3">
			    <input type="radio" name="pos" id="pos4">
			    <ul>
			      <li>
			      <a href="#">
			      	<img class="swiper-slide" src="https://placeimg.com/150/100/tech">
			      </a>
			      <img class="swiper-slide" src="https://placeimg.com/150/100/tech">
			      <img class="swiper-slide" src="https://placeimg.com/150/100/tech">
			      </li>
			      <li>
			      <img class="swiper-slide" src="https://placeimg.com/150/100/animals">
			      <img class="swiper-slide" src="https://placeimg.com/150/100/animals">
			      <img class="swiper-slide" src="https://placeimg.com/150/100/animals">
			      </li>
			      <li>
			      <img class="swiper-slide" src="https://placeimg.com/150/100/tech">
			      <img class="swiper-slide" src="https://placeimg.com/150/100/tech">
			      <img class="swiper-slide" src="https://placeimg.com/150/100/tech">
			      </li>
			      <li>
			      <img class="swiper-slide" src="https://placeimg.com/150/100/animals">
			      <img class="swiper-slide" src="https://placeimg.com/150/100/animals">
			      <img class="swiper-slide" src="https://placeimg.com/150/100/animals">
			      </li>
			    </ul>
			    <p class="bullet">
			      <label for="pos1">1</label>
			      <label for="pos2">2</label>
			      <label for="pos3">3</label>
			      <label for="pos4">4</label>
			    </p>
			</div>
      
      
      <hr>
      
      <div>
         <h1>��ǰ����</h1>
         
      		<div>
      		    <ul class="menu">
			        <li>
			            <a href="#">������</a>
			            <ul>
			                <li><a href="#"><img src="https://placeimg.com/1100/480/animals"></a></li>
			            </ul>
			        </li>
			        <li>
			            <a href="#">��������</a>
			            <ul>
			                <li><a href="#"><img src="https://placeimg.com/150/100/animals"></a></li>
			            </ul>
			        </li>
			        <li>
			            <a href="#">����</a>
			            <ul>
			                <li><a href="#"><img src="https://placeimg.com/150/100/animals"></a></li>
			            </ul>
			        </li>
			        <li>
			            <a href="#">QnA</a>
			            <ul>
			                <li><a href="#"><img src="https://placeimg.com/150/100/animals"></a></li>
			            </ul>
			        </li>
			    </ul>
      		</div>
      
      </div>
   </div>
   </div>
</body>
</html>