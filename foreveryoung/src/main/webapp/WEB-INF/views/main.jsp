<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

<style>
hr {
	width: 1020px;
	text-align: center;
	margin: 0 auto;
}
.index_01 {
	width: 1020px;
	height: 500px;
	text-align: center;
	margin: 0 auto;
}
.index_01 > .index_slide1 {
	width: 100%;
	width: 100%;
	overflow: hidden;
}
.index_slide > ul > li{
	display: inline-block;
}
.index_btn {
	width: 1020px;
	height: auto;
	text-align: center;
	margin: o auto;
}

.index_btn ul {
	width: 300px;
	height: 100%;
	text-align: center;
	float: left;
}
.index_btn ul > li {
	width: 33%;
	height: 100%;
	float: left;
	display: inline-block;
}
.index_btn ul > li > button {
	width: 100%;
	height: 50px;
	float: left;
	display: inline-block;
}
.second-box {
	width: 1020px;
	height: 500px;
	text-align: center;
	margin: 0 auto;
}
.third-box {
	width: 1020px;
	height: 500px;
	text-align: center;
	margin: 0 auto;
}

.index_title {
   padding-top: 20px;
   padding-bottom: 20px;
   color: #222;
}

.category-box {
	width: 100%;
	height: 47px;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
}
.category-box ul {
	float: left;
	text-align: center;
	margin: 0 auto;
    padding: 0;
    width: 100%;
}
.category-box li {
 	padding-top: 13px;
    display: inline-block;
    text-align:center;
    width: 14%;
    height: 100%;
    position: relative;
    float: left;
}
.category-box li a {
    padding: 20px;
    font-style: normal;
    font-size: 16px;
    line-height: 24px;
    font-weight: 600;
    letter-spacing: -.24px;
    color: #222;
}

.slide {
	height: 300px;
    min-width: 1020px;
    width: 100%;
    position: relative;
    background-color: #ffc948;
}
   .slide{height:300px;overflow:hidden;position:relative;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;transition:1s;}
    .slide li:nth-child(1){background:#ffa;}
    .slide li:nth-child(2){background:#faa;}
    .slide li:nth-child(3){background:#afa;}
    .slide li:nth-child(4){background:#aaf;}
    .slide input{display:none;}
    .slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
    .slide .bullet label{
    width:15px;height:15px;
    border-radius:10px;
    border:none;display:inline-block;
    background:#fff;font-size:0;
    transition:0.5s;cursor:pointer;
    margin-left: 10px;
    }
    /* 슬라이드 조작 */
    #pos1:checked ~ ul li:nth-child(1),
    #pos2:checked ~ ul li:nth-child(2),
    #pos3:checked ~ ul li:nth-child(3),
    #pos4:checked ~ ul li:nth-child(4){opacity:1;}
    /* bullet 조작 */
    #pos1:checked ~ .bullet label:nth-child(1),
    #pos2:checked ~ .bullet label:nth-child(2),
    #pos3:checked ~ .bullet label:nth-child(3),
    #pos4:checked ~ .bullet label:nth-child(4){background:#666;}
    
/* 상품 리스트 */
.price {
	color: #FF4646;
	font-size: 20px;
	text-align: center;
}
.detail > img{
	display: inline-block;
	width:210px;
	height:200px;
}
.pList li {
	display: inline-block;
    padding: 10px;
    margin : 1rem 1.5rem;
    cursor: pointer;
    position: relative;
    width : 210px;
}
.vot_btn {
	position : absolute;
	top:160px;
	left:150px;
	background-color:white;
}
.vot_btn > img {
	width:50px;
	heigth:50px;
}
</style>
<script type="text/javascript">
$(function(){

	$('#back-to-top').on('click',function(e){
	      e.preventDefault();
	      $('html,body').animate({scrollTop:0},600);
	  });
	  
	  $(window).scroll(function() {
	    if ($(document).scrollTop() > 100) {
	      $('#back-to-top').addClass('show');
	    } else {
	      $('#back-to-top').removeClass('show');
	    }
	  });

		
	//처음에 내용 숨기기
	$(".index_slide>ul>li").hide();
	$(".index_slide>ul>li:first-child").show();
	
	//버튼 클릭시 내용 나오도록
	$(".event_btn1").click(function(){
	        if($(".slide1").css('display') == 'none'){
	        	$(".slide1").show();
	        	$(".slide1").next().next().hide();
	       		$(".slide1").next().hide();
	   		 }else{
	   			$(".slide1").hide();
	    	}
	});
	
	$(".event_btn2").click(function(){
        if($(".slide2").css('display') == 'none'){
        	$(".slide2").show();
        	$(".slide2").prev().hide();
       		$(".slide2").next().hide();
   		 }else{
   			$(".slide2").hide();
    	}
	});
	
	$(".event_btn3").click(function(){
        if($(".slide3").css('display') == 'none'){
        	$(".slide3").show();
        	$(".slide3").prev().hide();
        	$(".slide3").prev().prev().hide();
   		 }else{
   			$(".slide3").hide();
    	}
	});

		
});
</script>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>

<div class="slide">
  	<input type="radio" name="pos" id="pos1" checked>
    <input type="radio" name="pos" id="pos2">
    <input type="radio" name="pos" id="pos3">
    <input type="radio" name="pos" id="pos4">
    <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
    <p class="bullet">
      <label for="pos1">1</label>
      <label for="pos2">2</label>
      <label for="pos3">3</label>
      <label for="pos4">4</label>
    </p>
</div>

<div class="index_01">
	<div class="index_header">
		<h2 class="index_title">이 상품은 어떤가요?</h2>
	</div>
	<div class="index_slide">
		<ul>
			<li class="slide1"><a href="#">슬라이드1</a></li>
			<li class="slide2"><a href="#">슬라이드2</a></li>
			<li class="slide3"><a href="#">슬라이드3</a></li>
		</ul>
	</div>
	<div class="index_btn">
		<ul>
			<li><button class="event_btn1">1</button></li>
			<li><button class="event_btn2">2</button></li>
			<li><button class="event_btn3">3</button></li>
		</ul>
	</div>
</div>


<hr>

<div class="second-box">
	<h2 class="event-title">이번주 BEST</h2>
	<div class="category-box">
	<ul>
		<li><a href="#">전체</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=skincare">스킨케어</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=makeup">메이크업</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=bodycare">바디케어</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=haircare">헤어케어</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=perfume">향수/디퓨저</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=manscare">남성케어</a></li>
	</ul>
	</div>
	
	<button class="more-btn">더보기</button>
	
</div>

<hr>

<div class="third-box">
	<h2 class="event-title">주목해야 할 신상</h2>
	<button class="more-btn">더보기</button>
</div>

<a id="back-to-top"></a>

<jsp:include page="template/footer.jsp"></jsp:include>

</body>
</html>