<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
    font-family: 'ëëęł ë', sans-serif;
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
	height: auto;
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
    margin-left: 250px;
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
		}else if(id != '' && auth == "admin"){ 	 
			 location.href = '/admin/dashBoard';
		}else{
			 alert("ëĄęˇ¸ě¸ í ěŹěŠ ę°ëĽíŠëë¤.");
        	 location.href = '/member/login';
		}
	});
	
	$(".func-cart").click(function(){
		var id = "${check}";
		var auth = "${auth}";
		
		if(id != '' && auth == "customer"){
			 location.href = '/member/cartList';
		}else if(id != '' && auth == "seller"){ 	 
			 alert("ěźë°íěë§ ěŹěŠ ę°ëĽíŠëë¤.");
			 return false;
		}else if(id != '' && auth == "admin"){ 	 
			 alert("ěźë°íěë§ ěŹěŠ ę°ëĽíŠëë¤.");
			 return false;
		}else{
			 alert("ëĄęˇ¸ě¸ í ěŹěŠ ę°ëĽíŠëë¤.");
        	 location.href = '/member/login';
		}
	});
	
});

</script>
</head>
<body>
<%--   <h3>ëĄęˇ¸ě¸ íě¸ ěŹëś :
  		<c:forEach var="name" items="${pageContext.session.attributeNames}">
    		Name: ${name}
    		Value: ${sessionScope[name]}
		</c:forEach>
	</h3> --%>
<div class="login-box">

 	<c:choose>
   		<c:when test="${check ne null && auth eq 'customer'}">
			<ul>
				<li><a href="/member/mypage"><c:out value="${check}"/> ë ë°ę°ěľëë¤</a></li>
				<li><a href="/member/logout">ëĄęˇ¸ěě</a></li>
			</ul>
    	</c:when>
   		<c:when test="${check ne null && auth eq 'seller'}">
			<ul>
				<li><a href="/member/mypage_brand/mypage_brand_main"><c:out value="${check}"/> ë ë°ę°ěľëë¤</a></li>
				<li><a href="/member/logout">ëĄęˇ¸ěě</a></li>
			</ul>
   		</c:when>
   		<c:when test="${check ne null && auth eq 'admin'}">
			<ul>
				<li><a href="/admin/dashBoard"><c:out value="${check}"/> ë ë°ę°ěľëë¤</a></li>
				<li><a href="/admin/logout">ëĄęˇ¸ěě</a></li>
			</ul>
   		</c:when>
   		<c:otherwise>
   			<ul>
				<li><a href="/member/login">ëĄęˇ¸ě¸</a></li>
				<li><a href="/member/join_choice">íěę°ě</a></li>
				<li><a href="/admin/login">ę´ëŚŹě</a></li>
			</ul>
   		</c:otherwise>
	</c:choose>
</div>
<div class="top-box">
	<div class="logo-box">
		<a href="${pageContext.request.contextPath}/main" class="logo"><img src="/resources/img/logo.png" width="300" height="34"></a>
	</div>
	<form class="form-inline" action="searchResults" method="post">
		<div class="search-box">
    		<input type="text" name="keyword" class="search-input"  placeholder="Search" value="${map.keyword}">
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
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=skincare">ě¤í¨ěźě´</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=makeup">ëŠě´íŹě</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=bodycare">ë°ëěźě´</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=haircare">í¤ě´ěźě´</a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=perfume">íĽě/ëí¨ě </a></li>
		<li><a href="${pageContext.request.contextPath}/product/categoryList?category=manscare">ë¨ěąěźě´</a></li>
		<li><a href="/service_center/notice">ęł ę°ěźí°</a></li>
	</ul>
	</div>
</div>

</body>
</html>