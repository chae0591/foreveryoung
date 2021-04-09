<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
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
	
	<div class="last-box">
		<button class="inquiry-btn">1:1 문의하기</button>
	</div>
	
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>