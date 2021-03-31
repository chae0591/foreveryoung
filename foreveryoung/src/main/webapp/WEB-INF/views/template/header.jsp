<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="style.css" rel="stylesheet" type="text/css" />
 <style>
.top-box {
	width: 1020px;
	height: 150px;
	text-align: center;
	margin: 0 auto;
}
.logo-box {
	float: left;
	width: 40%;
	margin: 0;
	padding-top: 60px;
}
.search-box {
	width: 20%;
	display: inline-block;
	padding-top: 50px;
}
.search-input{
 	width: 100%;
    padding: 12px 24px;
    background-color: transparent;
    transition: transform 250ms ease-in-out;
    font-size: 14px;
    line-height: 18px; 
    color: #575756;
    background-color: transparent;
    background-image: url("data:image/svg+xml;charset=utf8,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cpath d='M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z'/%3E%3Cpath d='M0 0h24v24H0z' fill='none'/%3E%3C/svg%3E");
    background-repeat: no-repeat;
    background-size: 18px 18px;
    background-position: 95% center;
    border-radius: 50px;
    border: 1px solid #575756;
    transition: all 250ms ease-in-out;
    backface-visibility: hidden;
    transform-style: preserve-3d;
}      
.search-input::placeholder {
    color: color(#575756 a(0.8));
    text-transform: uppercase;
    letter-spacing: 1.5px;
    }
      
.search-input:hover,
.search-input:focus {
    padding: 12px 0;
    outline: 0;
    border: 1px solid transparent;
    border-bottom: 1px solid #575756;
    border-radius: 0;
    background-position: 100% center;
}

.login-box{
	margin: 0;
	float: right;
	width: 40%;
	padding-top: 60px;
}
.login-box ul{
	float: right;
	text-align:center;
    list-style-type: none;
    margin: 0;
    padding: 0;
    position: relative;
}
.login-box li {
    display: inline-block;
    text-align:center;
}
.login-box li a {
    color: #000;
    padding: 10px;
    text-decoration: none;
    font-size: 14px;
    line-height: 20px;
    font-weight: 200;
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
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 100%;
    position: relative;
}
.nav li {
    display: inline-block;
    text-align:center;
    padding-top: 13px;
}
.nav li a {
    color: #000;
    padding: 40px;
    text-decoration: none;
    font-size: 16px;
    font-weight: 700;
}
.banner {
	height: 300px;
    min-width: 1020px;
    width: 100%;
    position: relative;
    border-bottom: 2px solid #555;
}
 
</style>
</head>
<body>

<div class="top-box">
	<div class="logo-box">logo</div>
	<div class="search-box">
    	<input class="search-input" type="text" placeholder="Search">
    </div>
    <div class="login-box">
		<ul>
			<li><a href="#">로그인</a></li>
			<li><a href="#">회원가입</a></li>
			<li><a href="#">관리자</a></li>
		</ul>
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
		<li><a href="">고객센터</a></li>
	</ul>
</div>

<div class="banner">
	<h1>배너</h1>
</div>

</body>
</html>