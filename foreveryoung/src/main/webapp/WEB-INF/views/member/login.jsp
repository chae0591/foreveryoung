<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/common.css">
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/login.css">
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
	    $(document).ready(function () {
			var formObj = $("#loginform")
			
			$(".login-btn").on("click", function () {
				if(!$(".login-id").val()){
					window.alert("아이디를 입력하세요");
					$(".login-id").focus();
					return;
				}
				
				if(!$(".login-pw").val()){
					window.alert("비밀번호를 입력하세요");
					$(".login-id").focus();
					return;
				}
				
				if($("input:radio[value='customer']").is(":checked")) {					
					formObj.attr("action", "/member/login_customer")
					formObj.attr("method", "post")
					formObj.submit();
				}
				else if($("input:radio[value='seller']").is(":checked")) {
					$(".login-id").attr("name", "brand_id")
					$(".login-pw").attr("name", "brand_pw")
					
					formObj.attr("action", "/member/login_brand")
					formObj.attr("method", "post")
					formObj.submit();
				}
			})
			
			$("#join_btn").click(function(){
				self.location = "/member/join"
			})
			
			$("#brand_join_btn").click(function(){
				self.location = "/member/join_brand"
			})
		})
    </script>
</head>
<body>
	<div class="outbox" style="width: 500px">
		<div class="login-wrapper">
			<div class="login-title">foreveryoung</div>
	    	<input type="radio" name="login_type" value="customer" checked="checked"> 구매회원
	    	<input type="radio" name="login_type" value="seller"> 판매회원
	    	<form action="sample" method="post" id="loginform">
		        <input type="text" class="login-id" name="user_id">
		        <input type="password" class="login-pw" name="user_pw">
		        <div class="row left"><a>아이디 찾기</a>|<a>비밀번호 찾기</a></div>
		        <input type="button" value="로그인" class="login-btn">
		        <c:if test="${not empty param.error}">
		        	<div style="color:red;">입력한 정보가 맞지 않습니다.</div>
		        </c:if>
		        <hr>
		        <input type="button" value="구매회원가입" class="join-btn" id="join_btn">
		        <input type="button" value="판매회원가입" class="join-btn" id="brand_join_btn">
	        </form>
	    </div>
	</div>
</body>
</html>