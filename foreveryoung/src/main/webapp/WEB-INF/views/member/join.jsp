<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="join" method="post">
		<div class="outbox" style="width: 500px">
			<div class="row center">
				<h2>회원 정보 입력</h2>
			</div>
			<div class="row">
				<label>ID</label>
				<input type="text" name="user_id" required class="input" placeholder="6~12자 영문 소문자 또는 숫자">
			</div>
			<div class="row">
				<label>Password</label>
				<input type="password" name="user_pw" required class="input" placeholder="6~12자 영문 소문자/대문자/숫자">
			</div>
			<div class="row">
				<label>Name</label>
				<input type="text" name="user_name" required class="input" placeholder="한글 2~10자">
			</div>
			<div class="row">
				<label>Phone</label>
				<input type="text" name="user_phone" required class="input">
			</div>
			<div class="row">
				<label>Gender</label>
				<input type="radio" name="user_gender" class="input" value="M"> M
				<input type="radio" name="user_gender" class="input" value="F"> F
			</div>
			<div class="row">
				<label>Birth</label>
				<input type="date" name="user_birth" class="input">
			</div>
			<div class="row">
				<input type="submit" value="회원가입" class="input">
			</div>
		</div>
	</form>
</body>
</html>