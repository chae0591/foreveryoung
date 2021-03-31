<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<form action="join_brand" method="post">
		<div class="outbox" style="width: 500px">
			<div class="row center">
				<h2>회원 정보 입력</h2>
			</div>
			<div class="row">
				<label>ID</label>
				<input type="text" name="brand_id" required class="input" placeholder="6~12자 영문 소문자 또는 숫자">
			</div>
			<div class="row">
				<label>Password</label>
				<input type="password" name="brand_pw" required class="input" placeholder="6~12자 영문 소문자/대문자/숫자">
			</div>
			<div class="row">
				<label>Name</label>
				<input type="text" name="brand_name" required class="input" placeholder="한글 2~10자">
			</div>
			<div class="row">
				<label>Phone</label>
				<input type="text" name="brand_phone" required class="input">
			</div>
			
			<div class="row">
				<input type="submit" value="등록" class="input">
			</div>
		</div>
	</form>
</body>
</html>