<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인</title>
    <style>
    </style>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
	    $(document).ready(function () {
			var formObj = $("#loginform")
			
			$(".login-btn").on("click", function () {
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
		})
    </script>
</head>
<body>
	
    <div class="login-wrapper">
    	<input type="radio" name="login_type" value="customer" checked="checked"> 구매회원
    	<input type="radio" name="login_type" value="seller"> 판매회원
    	<form action="sample" method="post" id="loginform">
        <div class="login-title">foreveryoung</div>
        <input type="text" class="login-id" name="user_id">
        <input type="password" class="login-pw" name="user_pw">
        <input type="submit" value="로그인" class="login-btn">
        <hr>
        <input type="button" value="회원가입" class="join-btn">
        </form>
    </div>
</body>
</html>