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
.inquiry-btn {
	background-color: #555;
	color: #fff;
}
.service-btns button:hover {
	background-color: #555;
	color: #fff;
}
.select-on {
	width: 1020px;
	height: 80px;
	margin: 0 auto;
	padding: 0;
	margin-top: 20px;
	margin-bottom: 20px;
	background-color: #fafafa;
	position: relative;
	padding: 20px;
}
.select-on > .month-box {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	padding: 0;
	position: absolute;
	left: 35%;
}
.select-on button {
	float: left;
	width: 100px;
	height: 40px;
	border: 1px solid #e5e5e5;
    border-radius: 5px;
    background: #fff;
	margin-left: 10px;
}
.select-on p {
	color: #666;
    font-size: 15px;
    font-weight: 400px;
    float: left;
    position: absolute;
    top: 13%;
    left: 22%;
}
.inquiry-list {
	width: 1020px;
	height: auto;
	margin: 0 auto;
	display: block;
	margin-top: 20px;
	margin-bottom: 40px;
	border-top: 2px solid #666;
	border-bottom: 2px solid #666;
	position: relative;
}
.inquiry-list > .no-inquiry {
	width: 100%;
	height: 400px;
}
.inquiry-list > .no-inquiry ul {
	width: 100%;
	height: 100%;
}
.inquiry-list .no-inquiry ul > .img-cover {
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
.inquiry-list > .check-inquiry {
	width: 100%;
	min-height:60px;
}
.inquiry-list > .check-inquiry ul {
	width: 100%;
	height: 100%;
}
.inquiry-list > .check-inquiry li {
	width: 100%;
	height: 60px;
	display: block;
	border-bottom: 1px solid #e5e5e5;
}
.inquiry-list > .check-inquiry > ul > li > .onReply {
	width: 15%;
	height: 100%;
	float: left;
	display: inline-block;
	padding-top: 20px;
	padding-left: 50px;
}
.inquiry-list > .check-inquiry > ul > li > .offReply {
	width: 15%;
	height: 100%;
	float: left;
	display: inline-block;
	padding-top: 20px;
	padding-left: 50px;
}
.inquiry-list > .check-inquiry > ul > li > .onReply > strong {
	display: inline-block;
    width: 70px;
    height: 20px;
    border-radius: 10px;
    color: #fff;
    font-size: 12px;
    text-align: center;
    line-height: 20px;
    background: #00C8F5;
}
.inquiry-list > .check-inquiry > ul > li > .offReply > strong {
	display: inline-block;
    width: 70px;
    height: 20px;
    border-radius: 10px;
    color: #fff;
    font-size: 12px;
    text-align: center;
    line-height: 20px;
    background: #555;
}
.inquiry-list > .check-inquiry > ul > li > .row2 {
	width: 85%;
	height: 100%;
	float: left;
	display: inline-block;
	padding-top: 20px;
}
.inquiry-list > .check-inquiry a {
	float: left;
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
</style>

<script>
$(document).ready(function(){
	search_month = function(monthvalue){
		$.ajax({
			url : '/service_center/inquiry_search_month',
			data : {monthval : monthvalue},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".inquiry-list").html(result);
			}
		});
	}
	
	$(".month1").click(function(){
		search_month(1);
	});
	$(".month3").click(function(){
		search_month(3);
	});
	$(".month6").click(function(){
		search_month(6);
	});
	$(".month12").click(function(){
		search_month(12);
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
   			location.href = '/service_center/inquiryRegister';
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
	
	<div class="select-on">
		<p>문의글 등록기간</p>
		<div class="month-box">
		<button type="button" class="month1">1개월</button>
		<button type="button" class="month3">3개월</button>
		<button type="button" class="month6">6개월</button>
		<button type="button" class="month12">12개월</button>
		</div>
	</div>
	
	<div class="inquiry-list">
	<c:choose>
   	 	<c:when  test="${empty inquiryList}">
		<div class="no-inquiry">
				<ul>
					<li class="img-cover">등록하신 1:1문의가 없습니다</li>
				</ul>
		</div>
    	</c:when>
      	<c:otherwise>
      	<div class="check-inquiry">
		 		<ul>
		 			<c:forEach items="${inquiryList}" var="inquiryList">
		 			<li>
		 				<input type="hidden" name="inquiry_no" value="${inquiryList.inquiry_no}">
		 				<input type="hidden" name="user_num" value="${inquiryList.user_id}">
		 				<input type="hidden" name="user_num" value="${inquiryList.inquiry_regDate}">
		 				<c:choose>
							<c:when test="${ inquiryList.reply_no == 0}">
									<div class="offReply"><strong>답변대기</strong></div>
							</c:when>
							<c:otherwise>
									<div class="onReply"><strong>답변완료</strong></div>
							</c:otherwise>
							</c:choose>
		 				<div class="row2"><a href="/service_center/inquiryDetail?inquiry_no=${inquiryList.inquiry_no}"><c:out value="${inquiryList.inquiry_title}" /></a></div>
		 			</li>
		 			</c:forEach>
		 		</ul>
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