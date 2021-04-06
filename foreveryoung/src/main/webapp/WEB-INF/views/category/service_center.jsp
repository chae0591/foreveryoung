<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}
html, body {
    word-spacing: -1px;
    color: #666;
    font-size: 14px;
    line-height: 20px;
    font-family: 'dotum', '돋움', sans-serif;
    letter-spacing: -0.04em;
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
}
ol, ul {
    list-style: none;
}
a {
	text-decoration: none;
}
label, input.button, input.submit, input.image, button {
    cursor: pointer;
}
input[type="submit"], button {
    border: 0;
    padding: 0;
    box-shadow: none;
}
.banner {
	text-align: center;
	min-width: 1020px;
	height: 100px;
	background-color: #dddddd;
}

.service-btns {
    padding: 0;
    width: 1020px;
    height:55px;
	text-align: center;
	margin:0 auto;
}

.service-btns button{
    width: 50%;
	height:100%;
	text-align: center;
	float: left;
	position: relative;
	margin-top: 20px;
}
.servicesearch-box {
	width: 1020px;
	height: 150px;
	margin: 0 auto;
	text-align: center;
}
.servicesearch-box > label {
	color: #666;
    font-size: 16px;
    font-weight: 400px;
    text-align: left;
}
.servicesearch-box > .searchInp {
	float: left;
    width: 50%;
    height: 44px;
    border: 1px solid #e5e5e5;
    font-size: 14px;
    line-height: 22px;
    background-color: #fff;
    color: #888;
    border-radius: 20px;
}
.servicesearch-box > .searchBtn {
	float: right;
    width: 25px;
    height: 27px;
    margin: 10px 19px 0 0;
    background: url(https://image.oliveyoung.co.kr/pc-static-root/image/comm/ico_search25x27.png) no-repeat 0 0;
    font-size: 0;
    text-indent: -99999px;
    line-height: 0;
} 
.category-btns {
	width: 1020px;
	height: 118px;
	margin: 0 auto;
}
.catogory-btns ul {
	width: 100%;
	position: realative;
}
.category-btns li {
	width: 14%;
	height: 100%;
	float: left;
	position: realative;
}
.category-btns button {
	width: 100%;
    height: 120px;
    color: #666;
    background: #fff;
    box-sizing: border-box;
    font-size: 14px;
    padding-top: 60px;
    font-weight: 400;
 	border: 1px solid #e5e5e5;
}
</style>
</head>
<body>

<jsp:include page="../template/header.jsp"></jsp:include>
	<div class="banner">
		<h2>고객센터</h2>
		<p>무엇을 도와드릴까요?</p>
	</div>
		
	<div class="service-btns">
		<button><a href="#">공지사항</a></button>
		<button><a href="#">1:1 문의</a></button>
	</div>
	
	<div class="servicesearch-box">
		<label>공지사항 검색</label>
		<form>
			<input class="searchInp" type="text" placeholder="질문을 검색하세요.">
			<input class="searchBtn" type="submit" value="검색">
		</form>
	</div>
	
	<div class="category-btns">
		<ul>
			<li><button>회원</button></li>
			<li><button>주문/결제</button></li>
			<li><button>배송</button></li>
			<li><button>교환/환불/반품</button></li>
			<li><button>이벤트/쿠폰</button></li>
			<li><button>판매자</button></li>
			<li><button>기타</button></li>
		</ul>
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