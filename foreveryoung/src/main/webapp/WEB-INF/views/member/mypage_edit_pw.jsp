<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/css/member/js/bootstrap.js"></script>
<script>
$(document).ready(function () {
	$(".input[name=change_pw]").blur(function(){
		var pw = $(this).val();
		var regex = /^[a-zA-Z0-9!@#$]{5,11}$/;
		if(regex.test(pw)){
			$(this).next().text("올바른 비밀번호 형식입니다");
			$(this).next().removeClass("bad");
			$(this).next().addClass("good");
			$(this).addClass("correct");
		}
		else{
			$(this).next().text("비밀번호는는 영문 숫자 특수문자(!@#$) 조합 6자~12자까지 가능합니다.");
			$(this).removeClass("correct");
			$(this).next().removeClass("good");
			$(this).next().addClass("bad");
		}
	});
	
	$("#edit_pw_form").submit(function(e){
        e.preventDefault();
        
        $(".input").blur();
        
        var pw1 = $("input[name=change_pw]").val();
        var pw2 = $("#change_pw_check").val();
        
        if(pw1 && pw1 === pw2) {}
        else {
        	alert("비밀번호가 비밀번호 확인란과 같지 않습니다.");
        	return;
        }
        
        if($(".input.correct").length == 1){
            this.submit();
        }
        else {
        	window.alert("입력창을 확인해 주세요");
        }
	});
});
</script>
</head>
<body>
<header>
<jsp:include page="../template/header.jsp"></jsp:include>
</header>
<section>
<div class="container">
	<div class="row">
		<jsp:include page="mypagetemplate/mypagemenu.jsp"></jsp:include>
		<div class="col-md-8">
		<div class="contentbox">
			<form id="edit_pw_form" action="mypage_edit_pw" method="post">
			
				<input type="hidden" name="user_num" value="${user_info.user_num}">
				<div class="outbox" style="width: 500px">
					<fieldset class="outbox">
						<legend>비밀번호 수정</legend>
						<div class="row">
		                    <label>Current Password</label>
		                    <input type="password" name="current_pw" required class="input">
		                    <span>&nbsp;</span>
		                </div>
		                <div class="row">
		                    <label>Change Password</label>
		                    <input type="password" name="change_pw" required class="input">
		                    <span>&nbsp;</span>
		                </div>
		                <div class="row">
		                    <label>Password_Check</label>
		                    <input type="password" id="change_pw_check" required class="input" placeholder="바꿀 패스워드를 한번 더 입력해주세요">
		                    <span>&nbsp;</span>
		                </div>
		                <div class="row">
							<input type="submit" value="정보 수정" class="input">
						</div>
					</fieldset>
				</div>
			</form>
		</div>
	</div>
</div>
	</div>
	</section>
<footer>
<jsp:include page="../template/footer.jsp"></jsp:include>
</footer>
</body>
</html>	