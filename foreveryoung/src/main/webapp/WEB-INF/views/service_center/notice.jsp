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
.service-btns a {
text-decoration: none;
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
.service-btns button:hover, :focus{
    width: 50%;
	height:100%;
	text-align: center;
	float: left;
	position: relative;
	font-size: 20px;
	font-weight: 500;
	border-radius: 5px;
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
.srh-box > .searchInp {
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
</style>

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
	
	<div class="serviceSrh-box">
		<label>공지사항 검색</label>
		<form class="form-inline" action="#" method="post">
			<div class="srh-box">
				<input class="searchInp" type="text" placeholder="질문을 검색하세요.">
				<input class="searchBtn" type="submit" value="검색">
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
	
	<div class="service-list">
		<ul>
			<li>
				<p>배송비가 궁금해요</p>
				<div>
					<p>배송비 2,500</p>
				</div>
			</li>
		</ul>
	</div>
<jsp:include page="../template/footer.jsp"></jsp:include>

</body>
</html>