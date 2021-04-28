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
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

<style>
.banner {
	text-align: center;
	min-width: 1020px;
	height: 100px;
	background-color: #dddddd;
}
.banner-title {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
}
.banner-title  h2, p{
	float: left;
	position: inline-box;
	padding-top: 20px;
	margin-right: 10px;
}
.service-btns {
    padding: 0;
    width: 1020px;
    height:55px;
	text-align: center;
	margin:0 auto;
	margin-bottom:20px;
	margin-top: 20px;
}
.service-btns button{
    width: 50%;
	height:100%;
	text-align: center;
	float: left;
	position: relative;
	font-size: 20px;
	font-weight: 500;
	border-radius: 5px;
}
.notice-btn {
	background-color: #555;
	color: #fff;
}
.service-btns button:hover {
	background-color: #555;
	color: #fff;
}
.serviceSrh-box  {
	width: 1020px;
	height: 100px;
	margin: 0 auto;
	padding: 0;
	margin-top: 20px;
	background-color: #dddddd;
	position: relative;
}
.serviceSrh-box > label {
	color: #666;
    font-size: 20px;
    font-weight: 400px;
    float: left;
    position: absolute;
    top: 40%;
    left: 25%;
}
.srh-box {
	width: 350px;
	height: 40px;
	text-align: center;
	float: left;
	margin: 0;
	padding: 0;
	position: relative;
	border: 2px solid #e5e5e5;
	background-color: #fff;
    border-radius: 20px;
     position: absolute;
    top: 30%;
    left: 40%;
}
.serviceSrh-box > input {
	display: inline-block;
	float: left;
}
.srh-box > .keyword {
    float: left;
    position: relative;
	width: 80%;
    height: 100%;
    font-size: 14px;
    line-height: 22px;
    color: #888;
    border: 0px;
	margin-left: 20px;
	background-color: #fff;
}
.srh-box > .searchBtn {
    background: url( "/resources/img/search.png" ) no-repeat;
	 background-size: 20px 20px;
	 background-position: center;
     border: none;
     cursor: pointer;
     font-size: 0px;
     width: 10%;
     height: 100%;
     float: right;
     margin-right: 10px;
} 
.category-btns {
	width: 1020px;
	height: 118px;
	margin: 0 auto;
	margin-top: 20px;
}
.category-btns button {
	width: 145.7px;
    height: 100%;
    color: #666;
    background: #fff;
    box-sizing: border-box;
    font-size: 14px;
    padding-top: 60px;
    font-weight: 400;
 	border: 1px solid #e5e5e5;
 	float: left;
}
.category-btns > .notice1 {
	 background: url( "/resources/img/notice1.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice2 {
	 background: url( "/resources/img/notice2.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice3 {
	 background: url( "/resources/img/notice3.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice4 {
	 background: url( "/resources/img/notice4.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice5 {
	 background: url( "/resources/img/notice5.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice6 {
	 background: url( "/resources/img/notice6.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice7 {
	 background: url( "/resources/img/notice7.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.no-notice {
	width:100%;
	height: 400px;
}
.no-notice ul {
	width: 100%;
	height: 100%;
}
.no-notice ul > .img-cover {
	 background: url( "/resources/img/no_inquiry.png" ) no-repeat center 100px;
	 background-size: 150px 150px;
	 width: 100%;
     height: 100%;
     text-align: center;
     color: #888;
     font-size: 16px;
     text-align: center;
     line-height: 20px;
     padding-top: 280px;
}
.noticeList-box {
	width:1020px;
	height: auto;
	margin: 0 auto;
}
.notice-list {
	width: 1020px;
	height: auto;
	margin: 0 auto;
	display: block;
	margin-top: 20px;
	margin-bottom: 20px;
	border-top: 2px solid #666;
	border-bottom: 2px solid #666;
	position: relative;
}
.notice-list ul li {
	width: 100%;
}
.notice-list p {
	padding: 10px;
}
.notice-list > .open {
	width: 100%;
	height: 60px;
	border-bottom: 1px solid #e5e5e5;
	background: url( "/resources/img/list.png" ) no-repeat;
	background-size: 1020px 60px;
	background-position: 0% 0%;
	padding-left: 60px;
	padding-top: 10px;
}
.notice-list > .open > li {
	width: 100%;
	height: 100%;
	display: block;
}
.notice-list > .hide {
	width: 100%;
	min-height: 60px;
	background-color: #e6e6e6;
	padding-left: 60px;
}
.notice-list > .hide > li {
	width: 100%;
	height: 100%;
}
.last-box {
	width: 1020px;
	margin: 0 auto;
	text-align: center;
	height: auto;
	margin-bottom: 40px;
}
.inquiryGobtn {
	width: 150px;
	height: 50px;
	color: #fff;
    font-weight: 700;
    border-radius: 5px;
    font-size: 18px;
    line-height: 30px;
    background-color: #555;
}
.page {
	text-align: center;
	position: relative;
	margin: 0 auto;
	margin-bottom: 40px;
}
</style>

<script>
$(document).ready(function(){
	type_notice = function(typevalue){
		$.ajax({
			url : '/service_center/noticeType',
			data : {typeval:typevalue},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".noticeList-box").html(result);
			}
		});
	}
	
	$(".notice1").click(function(){
		type_notice("회원");
	});
	$(".notice2").click(function(){
		type_notice("주문/결제");
	});
	$(".notice3").click(function(){
		type_notice("배송");
	});
	$(".notice4").click(function(){
		type_notice("교환/환불/반품");
	});
	$(".notice5").click(function(){
		type_notice("이벤트/쿠폰");
	});
	$(".notice6").click(function(){
		type_notice("판매자");
	});
	$(".notice7").click(function(){
		type_notice("기타");
	});
	
	// 상품 등록 페이지 이동
	$("#productWrite").on("click", function(e) {
		location.href = "/product/productWrite" ;
	});
	
	//처음에 내용 숨기기
	$(".hide").hide();
	
	//게시글 클릭시 내용 나오도록
	$(".open").click(function(){
        if($(this).next().css('display') == 'none'){
        	$(this).next().show();
   		 }else{
       		$(".hide").hide();
    	}
	});
	
	//공지사항으로 이동
	$(".notice-btn").click(function(){
   			location.href = '/service_center/notice';
	});
	
	//1:1문의로 이동
	$(".inquiry-btn").click(function(){
		var id = "${check}";
		
        if(id == ''){
        	 alert("로그인 후 문의 가능합니다.");
        	 location.href = '/member/login';
   		 }else{
   			 location.href = '/service_center/inquiry';
    	}
	});
	
	//1:1버튼 클릭시
	$(".inquiryGobtn").click(function(){
		var id = "${check}";
		
        if(id == ''){
        	 alert("로그인 후 문의 가능합니다.");
        	 location.href = '/member/login';
   		 }else{
   			 location.href = '/service_center/inquiryRegister';
    	}
	});
	
	$(".searchBtn").click(function(){
		self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
	
});
</script>

</head>
<body>

<jsp:include page="../template/header.jsp"></jsp:include>
	<div class="banner">
		<div class="banner-title">
			<h2>고객센터</h2>
			<p>무엇을 도와드릴까요?</p>
		</div>
	</div>
		
	<div class="service-btns">
		<button class="notice-btn">공지사항</button>
		<button class="inquiry-btn">1:1 문의</button>
	</div>
	
	<div class="serviceSrh-box">
		<label>공지사항 검색</label>
		<form class="form-inline" action="notice" method="post">
			<div class="srh-box">		
				<input class="keyword" name="keyword" type="text" placeholder="질문을 검색하세요." value="${map.keyword}">
				<input class="searchBtn" type="submit" value="클릭">
			</div>
		</form>
	</div>
	
	<div class="category-btns">
			<button class="notice1">회원</button>
			<button class="notice2">주문/결제</button>
			<button class="notice3">배송</button>
			<button class="notice4">교환/환불/반품</button>
			<button class="notice5">이벤트/쿠폰</button>
			<button class="notice6">판매자</button>
			<button class="notice7">기타</button>
	</div>
	
	<div class="noticeList-box">
	<c:choose>
	<c:when test="${empty map.noticeList}">
		<div class="no-notice">
				<ul>
					<li class="img-cover">검색어에 맞는 결과가 없습니다</li>
				</ul>
		</div>
	</c:when>
	<c:otherwise>
	<div class="notice-list">
		<c:forEach items="${map.noticeList}" var="noticeList">
		<input type="hidden" name="notice_no" value="${noticeList.notice_no}">
		 		<div class="open">
		 			<ul>
		 				<li>
		 					<p>${noticeList.notice_type}</p> <p>${noticeList.notice_title}</p>
		 				</li>
		 			</ul>
		 		</div>
		 	
		 		<div class="hide" >
		 			<ul>
		 				<li>
		 					<p>${noticeList.notice_content}<p>
		 				</li>
		 			</ul>
		 		</div>
		</c:forEach>
		</div>
		</c:otherwise>
		</c:choose>
	</div>
	
	<div class="last-box">
		<button class="inquiryGobtn">1:1 문의하기</button>
	</div>
	
<jsp:include page="../template/footer.jsp"></jsp:include>

</body>
</html>