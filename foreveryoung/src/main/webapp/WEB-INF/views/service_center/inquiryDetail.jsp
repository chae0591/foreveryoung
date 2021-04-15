<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
.inquiry-btn {
	width: 150px;
	height: 50px;
	color: #fff;
    font-weight: 700;
    border-radius: 5px;
    font-size: 18px;
    line-height: 30px;
}
.inquiryDetail-box {
	width: 1020px;
	height: auto;
	margin: 0 auto;
	padding: 0;
	display: block;
	margin-top: 20px;
	margin-bottom: 40px;
	border-top: 2px solid #666;
	border-bottom: 2px solid #666;
	position: relative;
}
.detailTitle-box {
	width: 100%;
	height: 70px;
	margin: 0;
	padding: 10px;
	border-bottom: 1px dashed #e5e5e5;
}
.detailTitle-box > .regdate {
	float: right;
}
.detailText-box {
	width: 100%;
	height: auto;
	margin: 0;
	display: block;
}
.detailText-box > p > form:input {
	border: none;
}
.detailText-box > .inquiryContent {
	width: 100%;
	height: auto;
	min-height: 60px;
	background-color: yellow;
	position: relative;
	padding: 10px;
}
.detailText-box >.detailServebtns { 
	width: 100%;
	height: auto;
	background-color: #blue;
	border-bottom: 1px solid #e5e5e5;
	position: relative;
	text-align: center;
}
.detailText-box > .detailServebtns  button {
	width: 33%;
	height: 50px;
	color: #fff;
    font-weight: 700;
    border-radius: 5px;
    font-size: 18px;
    line-height: 30px;
    background-color: #555;
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
$(document).ready(function() {
		
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
	
	$(".btnModify").click(function(){
		var inquiry_no = $("#inquiry_no");
		var inquiry_noVal = inquiry_no.val();
		self.location = "/service_center/inquiryModify?inquiry_no=" + inquiry_noVal
	});
	
	$(".btnGoList").click(function(){
		self.location = "/service_center/inquiry"
	});
	
	$(".btnDelete").click(function(){
		var formObj = $('#inquiryDetail')
		
		 window.alert("문의글이 삭제되었습니다.");
		formObj.attr("action" , "/service_center/inquiryDelete")
		formObj.submit();				 
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
		<a href="/service_center/notice"><button class="notice-btn">공지사항</button></a>
		<a href="/service_center/inquiry"><button class="inquiry-btn">1:1 문의</button></a>
	</div>
	
	<div class="inquiryDetail-box">
		<form:form modelAttribute="inquiryDetail">
			<form:hidden path="inquiry_no"/>
			<div class="detailTitle-box">
				<p><form:input path="inquiry_title" readonly="true"/></p>
				<p><form:input path="user_id" readonly="true"/></p>
				<p class="regdate"><form:input path="inquiry_regDate" readonly="true"/></p>
			</div>
	
			<div class="detailText-box">
				<div class="inquiryContent">
					<p><form:input path="inquiry_content" readonly="true"/></p>
				</div>
				
				<div class="detailServebtns">
					<button class="btnGoList">목록으로</button>
					<button class="btnModify">수정</button>
					<button class="btnDelete">게시글 삭제</button>
				</div>
			</div>	
			<form:hidden path="user_num"/>
		 </form:form>
	</div>
		
		<div>
			<c:out value="${inquiryDetail.reply_content}"></c:out>
		</div>
	
	<div class="last-box">
		<button class="inquiryGobtn">1:1 문의하기</button>
	</div>
	
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>