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
	$(".input[name=user_name]").blur(function(){
		var name = $(this).val();
		var regex = /^[가-힣]{2,10}$/;
		if(regex.test(name)){
			$(this).next().text("올바른 형식입니다");
			$(this).next().removeClass("bad");
			$(this).next().addClass("good");
			$(this).addClass("correct");
		}
		else{
			$(this).next().text("이름은 최대 한글 10자까지 가능합니다.");
			$(this).removeClass("correct");
			$(this).next().removeClass("good");
			$(this).next().addClass("bad");
		}
	});
	
	$(".input[name=user_phone]").blur(function(){
		var phone = $(this).val();
		var regex = /^01[016-9]-[1-9][0-9]{3}-[0-9]{4}$/;
		if(regex.test(phone)){
			$(this).next().text("올바른 핸드폰번호 형식입니다");
			$(this).next().removeClass("bad");
			$(this).next().addClass("good");
			$(this).addClass("correct");
		}
		else{
			$(this).next().text("핸드폰 번호는 - 포함 13자리를 입력해 주세요");
			$(this).removeClass("correct");
			$(this).next().removeClass("good");
			$(this).next().addClass("bad");
		}
	});
	
	$("#edit_form").submit(function(e){
        e.preventDefault();
        
        $(".input").blur();
        
        if($(".input.correct").length == 2){
            this.submit();
        }
        else {
        	window.alert("입력창을 확인해 주세요");
        }
	});
	
	var user_gender = '<c:out value="${user_info.user_gender}"/>';
	
	if(user_gender === 'M') {
		$("input[value=M]").attr("checked", "checked");
	}
	else if (user_gender === 'F'){
		$("input[value=F]").attr("checked", "checked");
	}
	else {
		$("#xradio").attr("checked", "checked");
	}
	
	$("#editPw-btn").click(function(){
		self.location = "mypage_edit_pw";
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
                    <a href="mypage_c_edit">내 설정</a>
                    <ul>
                        <li><a href="mypage_c_edit">회원 정보 변경</a></li>
                        <li><a href="">주소록 변경</a></li>
                    </ul>
                </li>
			</ul>
		</div>
		<div class="contentbox">
			<form id="edit_form" action="mypage_edit" method="post">
			
			<input type="hidden" name="user_num" value="${user_info.user_num}">
			<div class="outbox" style="width: 500px">
				<div class="row center">
					<h2>회원 정보 수정</h2>
				</div>
				<fieldset class="outbox">
	                <legend>필수 정보</legend>
				    <div class="row">
	                    <label>ID</label>
	                    <table>
	                        <tbody>
	                            <tr>
	                                <td style="width: 95%;">
	                                    <input type="text" name="user_id" required class="input" value="${user_info.user_id}" readonly>
	                                    <span>&nbsp;</span>
	                                </td>
	                                <td>
	                                    <span>&nbsp;</span>
	                                </td>
	                            </tr>
	                        </tbody>
	                    </table>
	                </div>
	                <div class="row">
	                    <label>Password</label>
	                    <input type="button" id="eidtPw-btn" class="input input-inline" value="비밀번호 변경">
	                    <span>&nbsp;</span>
	                </div>
	                <div class="row">
	                    <label>Name</label>
	                    <input type="text" name="user_name" required class="input" placeholder="한글 2~10자" value="${user_info.user_name}">
	                    <span>&nbsp;</span>
	                </div>
	                <div class="row">
	                    <label>Phone</label>
	                    <input type="text" name="user_phone" required class="input" value="${user_info.user_phone}">
	                    <span>&nbsp;</span>
	                </div>
				</fieldset>
				<fieldset class="outbox">
	                <legend>선택 입력 정보</legend>
				    <div class="row">
	                    <label>Gender</label>
	                    <div>
	                    	<input id="xradio" type="radio" name="user_gender" class="input input-inline" value=""> 선택안함
	                        <input type="radio" name="user_gender" class="input input-inline" value="M"> 남성
	                        <input type="radio" name="user_gender" class="input input-inline" value="F"> 여성
	                    </div>
	                </div>
	                <div class="row">
	                    <label>Birth</label>
	                    <input type="date" id="dateinput" name="user_birth" class="input" value="${user_birth_date}">
	                </div>
				</fieldset>
				<div class="row">
					<input type="submit" value="정보 수정" class="input">
				</div>
			</div>
		</form>
		</div>
	</div>
</body>
</html>	