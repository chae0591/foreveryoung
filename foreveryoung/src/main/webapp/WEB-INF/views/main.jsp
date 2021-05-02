<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

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
.index_01, .index_02, .index_03 {
	width: 1020px;
	height: auto;
	text-align: center;
	margin: 0 auto;
	position: relative;
	overflow:hidden;
	display: block;
}
.index_01, .index_02, .index_03 > .index_slide {
	width: 100%;
	overflow: hidden;
	height: auto;
	position: relative;
	margin: 0 auto;
	text-align: center;
}
.index_slide > ul > li{
	display: inline-block;
	height: auto;
}

.index_title {
   padding-top: 20px;
   padding-bottom: 20px;
   color: #222;
}
.index_btn {
	width: 1020px;
	height: auto;
	margin: o auto;
	position:relative;
	text-align:center;
	margin-top: 30px;
	margin-bottom: 30px;
	 display:inline-block;
}

.index_btn button {
	width: 100px;
	height: 30px;
	border-radius: 5px;
    border:none;
    display:inline-block;
    background:#555;
    font-size:15;
    cursor:pointer;
    color: white;
    text-align:center;
    margin: o auto;
}
   
.category_box {
	width: 1020px;
	height: 47px;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
	position: relative;
	margin: 0 auto;
}
.category_box ul {
	float: left;
	text-align: center;
	margin: 0 auto;
    padding: 0;
    width: 100%;
}
.category_box li {
 	padding-top: 13px;
    display: inline-block;
    text-align:center;
    width: 14%;
    height: 100%;
    position: relative;
}
.category_box li > button {
  	width: 100%;
    height: 100%;
    font-style: normal;
    font-size: 16px;
    line-height: 24px;
    font-weight: 600;
    letter-spacing: -.24px;
    color: #222;
    background: none;
}
.slide {
	height: 300px;
    min-width: 1020px;
    width: 100%;
    position: relative;
    background-color: #ffc948;
}
.slide ul li {
	text-align: center;
	margin: 0 auto;
}
   .slide{height:300px;overflow:hidden;position:relative;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;transition:1s;}
    .slide li:nth-child(1){background:#E3ECE9;}
    .slide li:nth-child(2){background:#D1E3DF;}
    .slide li:nth-child(3){background:#E2E3D1;}
    .slide li:nth-child(4){background:#E4BECC;}
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
   
.banner-title {
	position: absolute;
    left: 270px;
    top: 55%;
    -webkit-transform: translate(0, -50%);
    -ms-transform: translate(0, -50%);
    transform: translate(0, -50%);
}  
.slide_titile {
	width: 170px;
    font-size: 26px;
    line-height: 28px;
    letter-spacing: 0;
    color: #333;
    font-weight: bold;
    word-break: keep-all;
    white-space: pre-line;
}   

.slide_titile2 {
	width: 170px;
    margin-top: 18px;
    font-size: 18px;
    line-height: 20px;
    letter-spacing: 0;
    color: #555;
} 
    
/* 상품 리스트 */
.pList1, .pList2, .pList3 {
	display: inline-block;
	list-style: none;
	width: 1020px;
}
.pList1 > li:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}
.pList2 > li:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}
.pList3 > li:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}

.pList1 a {
	margin: 1rem auto;
}
.pList2 a {
	margin: 1rem auto;
}
.pList3 a {
	margin: 1rem auto;
}

.pList1 a > label{
	display:inline-block;
	width: 200px;
	text-decoration:none;
	font-size:15px;
	height:20px;
	padding-left: 5px;
	padding-right: 5px;
}
.pList2 a > label{
	display:inline-block;
	width: 200px;
	text-decoration:none;
	font-size:15px;
	height:20px;
	padding-left: 5px;
	padding-right: 5px;
}
.pList3 a > label{
	display:inline-block;
	width: 200px;
	text-decoration:none;
	font-size:15px;
	height:20px;
	padding-left: 5px;
	padding-right: 5px;
}
.price {
	color: #FF4646;
	font-size: 20px;
	text-align: center;
	margin-top : 1rem;
}

.brand {
	color : #50B4F5;
	text-align: center;
}

.detail > img {
	display: inline-block;
	width:170px;
	height:170px;
}

.pList1 li {
	display: inline-block;
    padding: 10px;
    margin : 10px;
    cursor: pointer;
    position: relative;
    width : 190px;
    height: 300px;
}
.pList2 li {
	display: inline-block;
    padding: 10px;
    margin : 10px;
    cursor: pointer;
    position: relative;
    width : 190px;
    height: 300px;
}

.pList3 li {
	display: inline-block;
    padding: 10px;
    margin : 10px;
    cursor: pointer;
    position: relative;
    width : 190px;
    height: 300px;
}


.vot_btn {
	position : absolute;
	top:135px;
	left:135px;
	background-color:white;
}

.vot_btn > img {
	width:45px;
	heigth:45px;
}
.order {
	margin: 40px;
	position: absolute;
	width: 1000px;
	top: -50px;
	left: 650px;
}
.order li{
	display:inline-block;
	list-style: none;
	float:left;
	padding: 10px 20px;
}

.order li > .active {
	color: black;
	font-weight: bold;
}
</style>
<script type="text/javascript">
$(document).ready(function(){
	bestLankList = function(lankvalue){
		$.ajax({
			url : 'mainBest',
			data : {lankval:lankvalue},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".pList2").html(result);
			}
		});
	}

	$(".li1").click(function(){
		bestLankList("skincare");
	});
	$(".li2").click(function(){
		bestLankList("makeup");
	});
	$(".li3").click(function(){
		bestLankList("bodycare");
	});
	$(".li4").click(function(){
		bestLankList("haircare");
	});
	$(".li5").click(function(){
		bestLankList("perfume");
	});
	$(".li6").click(function(){
		bestLankList("manscare");
	});

	
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

		
 	/* //처음에 내용 숨기기
	$(".index_slide>ul>li").hide();
	$(".index_slide>ul>li:first-child").show();
	
	//버튼 클릭시 내용 나오도록
	$(".index_btn > .event_btn1").click(function(){
	        if($(".slide1").css('display') == 'none'){
	        	$(".slide1").show();
	        	$(".slide1").next().next().hide();
	       		$(".slide1").next().hide();
	   		 }else{
	   			$(".slide1").hide();
	    	}
	});
	
	$(".index_btn > .event_btn2").click(function(){
        if($(".slide2").css('display') == 'none'){
        	$(".slide2").show();
        	$(".slide2").prev().hide();
       		$(".slide2").next().hide();
   		 }else{
   			$(".slide2").hide();
    	}
	}); 
	
	$(".index_btn > .event_btn3").click(function(){
        if($(".slide3").css('display') == 'none'){
        	$(".slide3").show();
        	$(".slide3").prev().hide();
        	$(".slide3").prev().prev().hide();
   		 }else{
   			$(".slide3").hide();
    	}
	});*/
	
	$(".more_btn").click(function(){
		location.href="/product/categoryList?category=skincare";
	});

	var user_num = $("input[name='user_num']").val();
	if(user_num != "") {
		voteCheck();
	}
	
	function voteCheck() {
		if(user_num == "") {
			return false;
		} else {
		$.ajax({
			url : '/vote/selectVote',
			type: 'GET',
			data: {'user_num' : user_num},
			success : function(result) {
				var num = 0;
				for(var i in result) {
					var i = result[i];
					$("[data-no="+i+"]").find("#vote_img").attr("src", "/img/product/like.png");
					$("[data-no="+i+"]").attr("value", "true");
				}
			}
		});// ajax
		}
	} //end votecheck
	
	// 좋아요
	$(document).on('click', '.vot_btn', function(){
		var target = $(this);
		var user_num = $("input[name='user_num']").val();
		var product_no = $(this).data("no");
		if(user_num == null || user_num == "") {
			location.href="/member/login";
			return false;
		}
		
		var url;
		if($(this).attr("value") == "true") {
			url = "/vote/deleteVote";
		} else if ($(this).attr("value") == "false") {
			url = "/vote/insertVote";
		}
		
		$.ajax({
			url : url,
			data : {'user_num':user_num, 'product_no':product_no},
			type: 'POST',
			success : function(result) {
				$(target).attr("value", result);
				if(result == "true") {
					$(target).find(".like").attr("src", "/img/product/like.png");
					$("[data-no="+product_no+"]").find("#vote_img").attr("src", "/img/product/like.png");
					$("[data-no="+product_no+"]").attr("value", "true");
				} else {
					$(target).find(".like").attr("src", "/img/product/unlike.png");
					$("[data-no="+product_no+"]").find("#vote_img").attr("src", "/img/product/unlike.png");
					$("[data-no="+product_no+"]").attr("value", "false");
				}
				
				
				}
		}); // ajax
	}); // end 좋아요
});
</script>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<input type="hidden" name="user_num"value="${check}">
<div class="slide">
  	<input type="radio" name="pos" id="pos1" checked>
    <input type="radio" name="pos" id="pos2">
    <input type="radio" name="pos" id="pos3">
    <input type="radio" name="pos" id="pos4">
    <ul>
      <li><a href="${pageContext.request.contextPath}/product/categoryList?category=makeup">
      		<img src="/resources/img/cleanging.jpg" width="800" height="300">
      		<div class="banner-title"><p class="slide_titile">강력한 순삭 딥클렌징</p>
      		<p class="slide_titile2">화해 어플 1위</p></div>
      		</a>		
      </li>
      <li><a href="${pageContext.request.contextPath}/product/categoryList?category=skincare">
      		<img src="/resources/img/laneige.jpg" width="800" height="300">
      		<div class="banner-title"><p class="slide_titile">한율X라네즈</p>
      		<p class="slide_titile2">베스트 콜라보</p></div>
      		</a>			
      </li>
      <li><a href="${pageContext.request.contextPath}/product/categoryList?category=bodycare">
      		<img src="/resources/img/happy.jpg" width="800" height="300">
      		<div class="banner-title"><p class="slide_titile">일리윤&해피바스</p>
      		<p class="slide_titile2">역대급 할인 찬스!</p></div>
      		</a>	
      </li>
      <li><a href="${pageContext.request.contextPath}/product/categoryList?category=makeup">
      		<img src="/resources/img/banilaco.jpg" width="800" height="300">
      		<div class="banner-title"><p class="slide_titile">실패NO 꿀조합</p>
      		<p class="slide_titile2">봄에는 이 조합!</p></div>
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

<div class="index_01">
	<div class="index_header">
		<h2 class="index_title">이 상품은 어떤가요?</h2>
	</div>
	<div class="index_slide">
		<ul>
			<li class="slide1" >
				<ul class="pList1">
				<c:forEach var="randomList" items="${randomList}" begin="1" end="8" step="1" >
					<li>
						<input type="hidden" name="product_no" value="${randomList.product_no}">
						<a class="detail" href="${pageContext.request.contextPath}/detail_board/detail_main?product_no=${randomList.product_no}">
 							<img class="img-responsive" src="/viewImg?fileName=${randomList.image_save_name}&imageType=${randomList.image_type}">
 							<label class="brand"><c:out value="${randomList.brand_name}"/></label>
							<label><c:out value="${randomList.product_name}" /></label>
							<label class="price"><fmt:formatNumber value="${randomList.product_price}" pattern="###,###,###"/>원</label>
						</a>
							<button class="vot_btn" data-no="${randomList.product_no}" value="false">
								<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
							</button>
					</li>
				</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
	<div class="index_btn">
		<button class="more_btn">더보기</button>
	</div>
</div>

<hr>

<div class="index_02">
	<div class="index_header">
		<h2 class="index_title">이번주 BEST</h2>
	</div>
	<div class="category_box">
	<ul>
		<li><button class="li1">스킨케어</button></li>
		<li><button class="li2">메이크업</button></li>
		<li><button class="li3">바디케어</button></li>
		<li><button class="li4">헤어케어</button></li>
		<li><button class="li5">향수/디퓨저</button></li>
		<li><button class="li6">남성케어</button></li>
	</ul>
	</div>
	
	<div class="index_slide">
				<ul class="pList2">
				<c:forEach var="bestList" items="${bestList}" begin="1" end="8" step="1" >
					<li>
						<input type="hidden" name="product_no" value="${bestList.product_no}">
						<a class="detail" href="#">
 							<img class="img-responsive" src="/viewImg?fileName=${bestList.image_save_name}&imageType=${bestList.image_type}">
 							<label class="brand"><c:out value="${bestList.brand_name}"/></label>
							<label><c:out value="${bestList.product_name}" /></label>
							<label class="price"><fmt:formatNumber value="${bestList.product_price}" pattern="###,###,###"/>원</label>
						</a>
							<button class="vot_btn" data-no="${bestList.product_no}" value="false">
								<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
							</button>
					</li>
				</c:forEach>
				</ul>
	</div>
	<div class="index_btn">
		<button class="more_btn">더보기</button>
	</div>
</div>

<hr>

<div class="index_03">
	<div class="index_header">
		<h2 class="index_title">주목해야 할 신상</h2>
	</div>
	<div class="index_slide">
		<ul>
			<li class="slide1">
				<ul class="pList3">
				<c:forEach var="newList" items="${newList}" begin="1" end="8" step="1" >
					<li>
						<input type="hidden" name="product_no" value="${newList.product_no}">
						<a class="detail" href="#">
 							<img class="img-responsive" src="/viewImg?fileName=${newList.image_save_name}&imageType=${newList.image_type}">
 							<label class="brand"><c:out value="${newList.brand_name}"/></label>
							<label><c:out value="${newList.product_name}" /></label>
							<label class="price"><fmt:formatNumber value="${newList.product_price}" pattern="###,###,###"/>원</label>
						</a>
							<button class="vot_btn" data-no="${newList.product_no}" value="false">
								<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
							</button>
					</li>
				</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
	<div class="index_btn">
		<button class="more_btn">더보기</button>
	</div>
</div>

<a id="back-to-top"></a>

<jsp:include page="template/footer.jsp"></jsp:include>

</body>
</html>