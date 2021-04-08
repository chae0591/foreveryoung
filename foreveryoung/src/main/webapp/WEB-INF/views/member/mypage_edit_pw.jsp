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
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/mypage.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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

	<div class="outbox" style="width: 1000px; position: relative" >
		<div class="leftmenu">
		    <h3>마이페이지</h3>
			<ul class="leftmenu_list">
                <li>
                    <a href="">주문 내역</a>
                </li>
                
                <li>
                    <a href="cartList">장바구니</a>
                </li>
                
                <li>
                    <a href="">관심등록</a>
                    <ul>
                        <li><a href="">관심 상품</a></li>
                        <li><a href="">관심 브랜드</a></li>
                    </ul>
                </li>
                
                <li>
                    <a href="">내가 쓴 글</a>
                    <ul>
                        <li><a href="">상품 리뷰</a></li>
                        <li><a href="">Q & A</a></li>
                        <li><a href="">1 대 1 상담</a></li>
                    </ul>
                </li>
                
                <li>
                    <a href="mypage_edit">내 설정</a>
                    <ul>
                        <li><a href="mypage_edit">회원 정보 변경</a></li>
                        <li><a href="">주소록 변경</a></li>
                    </ul>
                </li>
			</ul>
		</div>
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
</body>
</html>	