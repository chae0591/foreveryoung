<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
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
	background-color: #fafafa;
	position: relative;
	padding: 20px;
	position: relative;
}
.select-on button {
	display: inline-block;
	float: left;
	width: 100px;
	height: 40px;
	border: 1px solid #e5e5e5;
    border-radius: 5px;
    background: #fff;
	margin-left: 5px;
}
.select-on p {
	position: 50% 10%;
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
	
	<div class="select-on">
		<p>문의글 등록기간</p>
		<ul>
			<li><button type="button">1개월</button></li>
			<li><button type="button">3개월</button></li>
			<li><button type="button">6개월</button></li>
			<li><button type="button">12개월</button></li>
		</ul>
	</div>
	
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>