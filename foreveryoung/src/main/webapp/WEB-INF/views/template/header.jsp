<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
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
    font-family: '나눔고딕', sans-serif;
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
 .login-box {
	width: 1020px;
	height: 40px;
	margin: 0 auto;
	padding-top: 13px;
}
.login-box ul{
	float: right;
	text-align:center;
    margin: 0;
    padding: 0;
    position: relative;
}
.login-box li {
    display: inline-block;
    text-align:center;  
	margin-left: 20px;
}
.login-box li a {
    color: #000;
    padding: 10px;
    font-size: 14px;
    line-height: 20px;
    font-style: normal;
    font-weight: 200;
}
.top-box {
	width: 1020px;
	height: 80px;
	text-align: center;
	margin: 0 auto;
}
.logo-box {
	float: left;
	width: 100px;
	margin: 0;
	margin-top: 20px;
}
.search-box {
	width: 300px;
	height: 40px;
	margin-top: 20px;
	text-align: center;
	float: left;
}
.search-input {
	width: 75%;
    height: 100%;
    border: 2px solid #e5e5e5;
    font-size: 14px;
    line-height: 22px;
    background-color: #fff;
    color: #888;
    border-radius: 20px;
}
.search-input > .into-btn{
	width: 25%;
	height: 100%;
}
.icons {
	float: right;
	width: 100px;
	height:30px;
	margin: 0 auto;
	margin-top: 20px;
}
.icons > input {
	display: inline-block;
	float: left;
	margin-left: 20px;
}
.icons > .func-my {
	 background: url( "/resources/img/func_my.png" ) no-repeat;
	 background-size: 30px 30px;
     border: none;
     width: 30px;
     height: 100%;
     cursor: pointer;
}
.icons > .func-cart {
	 background: url( "/resources/img/func_cart.png" ) no-repeat;
	  background-size: 30px 30px;
     border: none;
     width: 30px;
     height: 100%;
     cursor: pointer;
}

.nav {
	min-width: 1020px;
	height: 47px;
	background-color: #fff;
    border-top: 1px solid #dddddd;
    border-bottom: 2px solid #555;
    margin: 0 auto;
}
.nav ul {
	float: left;
	text-align:center;
    margin: 0;
    padding: 0;
    width: 100%;
    position: relative;
}
.nav li {
    display: inline-block;
    text-align:center;
    padding-top: 8px;
}
.nav li a {
    padding: 40px;
    font-size: 18px;
    line-height: 27px;
    font-weight: 500;
    letter-spacing: -.27px;
    color: #222;
    font-style: normal;
}

.nav li a:hover {
    padding: 40px;
    text-decoration: none;
    font-size: 18px;
    line-height: 27px;
    font-weight: 500;
    letter-spacing: -.27px;
   	color: #ffc948;
   	font-style: normal;
}

 
</style>
</head>
<body>
<div class="login-box">
		<ul>
			<li><a href="/member/sample">로그인</a></li>
			<li><a href="/member/join">회원가입</a></li>
			<li><a href="/admin/login">관리자</a></li>
		</ul>
</div>
<div class="top-box">
	<div class="logo-box">logo</div>
	<form class="form-inline" action="<%=request.getContextPath()%>/search/list" method="post">
		<div class="search-box">
    		<input class="search-input" type="text" placeholder="Search">
    	 	<input type="submit" value="검색" class="into-btn">
    	</div>
    </form>
    
    <div class="icons">
    	<input type="button" class="func-my" >
    	<input type="button"  class="func-cart">
    </div>
    
</div>
	
<div class="nav">
	<ul>
		<li><a href="">스킨케어</a></li>
		<li><a href="">메이크업</a></li>
		<li><a href="">바디케어</a></li>
		<li><a href="">헤어케어</a></li>
		<li><a href="">향수/디퓨저</a></li>
		<li><a href="">남성케어</a></li>
		<li><a href="/category/service_center">고객센터</a></li>
	</ul>
</div>

<h2>테스트</h2>
</body>
</html>