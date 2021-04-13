<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

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
	color: #555;
}
a:link, a:visited, a:hover, a:active {
	text-decoration: none;
	color: #555;
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
	width: 350px;
	height: 40px;
	text-align: center;
	float: left;
	margin: 0;
	margin-top: 18px;
	padding: 0;
	position: relative;
	border: 2px solid #e5e5e5;
	background-color: #fff;
    border-radius: 20px;
}
.search-box > input {
	display: inline-block;
	float: left;
}
.search-box > .search-input {
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
.search-box > .into-btn {
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
	min-width: 100%;
	height: 47px;
	background-color: #fff;
    border-top: 1px solid #dddddd;
    border-bottom: 2px solid #555;
    margin: 0 auto;
    position: relative;
}
.nav-line {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
    position: relative;
}
.nav-line ul {
	float: left;
	text-align:center;
    margin: 0;
    padding: 0;
    width: 100%;
}
.nav-line li {
    display: inline-block;
    text-align:center;
    padding-top: 8px;
    margin-left: 73px;
    vertical-align:middle;
}
.nav-line li:first-child {
	margin-left: 10px;
}
.nav-line li:last-child {
	margin-right: 10px;
}
.nav-line li a {
    font-size: 18px;
    line-height: 27px;
    font-weight: 500;
    letter-spacing: -.27px;
    color: #222;
    font-style: normal;
    position: relative;
}

.nav-line li a:hover {
    text-decoration: none;
    font-size: 18px;
    line-height: 27px;
    font-weight: 500;
    letter-spacing: -.27px;
   	color: #ffc948;
   	font-style: normal;
}
</style>
<script>
$(function(){

	$(".func-my").click(function(){
		var id = "${check}";
		var auth = "${auth}";
		
		if(id != '' && auth == "customer"){
			 location.href = '/member/mypage';
		}else if(id != '' && auth == "seller"){ 	 
			 location.href = '/member/mypage_brand/mypage_brand_main';
		}else{
			 alert("로그인 후 사용 가능합니다.");
        	 location.href = '/member/login';
		}
	});
	
	$(".func-cart").click(function(){
		var id = "${check}";
		var auth = "${auth}";
		
		if(id != '' && auth == "customer"){
			 location.href = '/member/cartList';
		}else if(id != '' && auth == "seller"){ 	 
			 alert("일반회원만 사용 가능합니다.");
			 return false;
		}else{
			 alert("로그인 후 사용 가능합니다.");
        	 location.href = '/member/login';
		}
	});
	
});

</script>
</head>
<body>
  <h3>로그인 확인 여부 :
  		<c:forEach var="name" items="${pageContext.session.attributeNames}">
    		Name: ${name}
    		Value: ${sessionScope[name]}
		</c:forEach>
	</h3>
<div class="login-box">

 	<c:choose>
   		<c:when test="${check ne null && auth eq 'customer'}">
			<ul>
				<li><a href="/member/mypage"><c:out value="${check}"/> 님 반갑습니다</a></li>
				<li><a href="/member/logout">로그아웃</a></li>
			</ul>
    	</c:when>
   		<c:when test="${check ne null && auth eq 'seller'}">
			<ul>
				<li><a href="/member/mypage_brand/mypage_brand_main"><c:out value="${check}"/> 님 반갑습니다</a></li>
				<li><a href="/member/logout">로그아웃</a></li>
			</ul>
   		</c:when>
   		<c:otherwise>
   			<ul>
				<li><a href="/member/login">로그인</a></li>
				<li><a href="/member/join_choice">회원가입</a></li>
				<li><a href="/admin/login">관리자</a></li>
			</ul>
   		</c:otherwise>
	</c:choose>
</div>
<div class="top-box">
	<div class="logo-box">logo</div>
	<form class="form-inline" action="<%=request.getContextPath()%>/search/search_results" method="post">
		<div class="search-box">
    		<input type="text" class="search-input"  placeholder="Search">
    	 	<input type="submit" class="into-btn">
    	</div>
    </form>
   
   	 <div class="icons">
		   <input type="button" class="func-my" >
		    <input type="button"  class="func-cart">
	 </div>
   
</div>
	
<div class="nav">
	<div class="nav-line">
	<ul>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=skincare">스킨케어</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=makeup">메이크업</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=bodycare">바디케어</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=haircare">헤어케어</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=perfume">향수/디퓨저</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=manscare">남성케어</a></li>
		<li><a href="/service_center/notice">고객센터</a></li>
	</ul>
	</div>
</div>

</body>
</html>