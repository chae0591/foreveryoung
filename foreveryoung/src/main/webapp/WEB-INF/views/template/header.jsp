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
	width: 100%;
	min-width: 1020px;
}
.log-box {
	float: left;
	width: 33%;

}
.search-box {
	float: center;
	width: 33%;
    position: relative;
    text-align: center;
    margin: 0 auto;
}
.search-input {
	position: relative;
    width: 340px;
    height: 20px;
    border-radius: 20px;
    border: 2px solid #bbb;
    background: #fff;
    margin: 10px 0;
    padding: 10px 12px;
}
.sch-btn {
	position: absolute;
	top: 22px;
    right: 300px;
    width: 21px;
    height: 21px;
    background: url(https://image.oliveyoung.co.kr/pc-static-root/image/comm/ico_search21x212.png) no-repeat 50% 50%;
	text-indent: -9999px;
	border: 0;
	outline: 0;
}
.login-box{
	float:right;
	width: 33%;
}
.login-box ul{
	float: left;
	text-align:center;
    list-style-type: none;
    margin: 0;
    padding: 0;
    position: relative;
}
.login-box li {
    display: inline-block;
    text-align:center;
    margin: 0 0 0 20px;
}
.login-box li a {
    color: #000;
    padding: 20px;
    text-decoration: none;
    ling-height: 44px;
    font-size: 16px;
    font-weight: 700;
}
.nav{
	width: 100%;
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
}
.nav li a {
    color: #000;
    padding: 20px;
    text-decoration: none;
    ling-height: 44px;
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
      <input type="text" class="search-input">
      <button type="sumbit" class="sch-btn">검색</button>
	</div>
	<div class="login-box">
		<ul>
			<li>로그인</li>
			<li>회원가입</li>
			<li>관리자</li>
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