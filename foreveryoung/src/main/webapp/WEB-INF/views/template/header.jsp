<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link href="style.css" rel="stylesheet" type="text/css" />
 <style type="text/css">
ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    background-color: #fff;
    border-top: 1px solid #dddddd;
    border-bottom: 2px solid #555;
    height: 47px;
    min-width: 1020px;
    width: 100%;
    position: relative;
}
ul:after{
    content:'';
    display: block;
    clear:both;
}
li {
    float: left;
}
li a {
    display: block;
    color: #000;
    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    ling-height: 44px;
    font-size: 16px;
    font-weight: 700;
}
.search {
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
	top: 7px;
    right: 18px;
    width: 21px;
    height: 21px;
    background: url(https://image.oliveyoung.co.kr/pc-static-root/image/comm/ico_search21x212.png) no-repeat 50% 50%;
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
<div>logo</div>
<div class="search">
      <input type="text" class="search-input">
      <button type="sumbit" class="sch-btn">검색</button>
</div>
<div>
	<button>로그인</button>
	<button>회원가입</button>
	<button>관리자</button>
</div>

<div>
	<ul class="menubar">
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