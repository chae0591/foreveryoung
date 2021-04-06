<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<jsp:include page="../template/header.jsp"></jsp:include>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/join.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function () {
		$(".input[name=user_id]").blur(function(){
			var id = $(this).val();
			var regex = /^[a-z][a-z0-9]{5,11}$/;
			if(regex.test(id)){
				$(this).next().text("올바른 아이디 형식입니다");
				$(this).next().removeClass("bad");
				$(this).next().addClass("good");
				$(this).addClass("correct");
			}
			else{
				$(this).next().text("아이디는 영문 숫자 조합 6자~12자까지 가능합니다.");
				$(this).removeClass("correct");
				$(this).next().removeClass("good");
				$(this).next().addClass("bad");
			}
		});
	
		$("input[id=duplicate]").click(function(){
			console.log("클릭");
			
			var user_id = $("input[name=user_id]").val();
			var user_id_check = $("input[id=duplicate]");
			
			$.ajax({
				url : "id_check",
				type : "get",
				data : {
					user_id : user_id
				},
				success : function(resp){
					if(resp == "Y") {
						user_id_check.next("span").text("사용가능");
						user_id_check.addClass("correct");
						user_id_check.next().removeClass("bad");
						user_id_check.next().addClass("good");
					}
					else if(resp == "N") {
						user_id_check.next("span").text("사용불가");
						user_id_check.removeClass("correct");
						user_id_check.next().removeClass("good");
						user_id_check.next().addClass("bad");
					}
				}
			});
		});
		
		$(".input[name=user_pw]").blur(function(){
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
		
		$("#join_form").submit(function(e){
	        e.preventDefault();
	        
	        $("input[id=duplicate]").click();
	        $(".input").blur();
	        
	        var pw1 = $("input[name=user_pw]").val();
	        var pw2 = $("#user_pw_check").val();
	        
	        if(pw1 && pw1 === pw2) {}
	        else {
	        	alert("비밀번호가 비밀번호 확인란과 같지 않습니다.");
	        	return;
	        }
	        
	        if($(".input.correct").length == 5){
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
    <form id="join_form" action="join" method="post">
		<div class="outbox" style="width: 500px">
			<div class="row center">
				<h2>회원 정보 입력</h2>
			</div>
			<fieldset class="outbox">
                <legend>필수 입력 정보</legend>
			    <div class="row">
                    <label>ID</label>
                    <table>
                        <tbody>
                            <tr>
                                <td style="width: 95%;">
                                    <input type="text" name="user_id" required class="input" placeholder="6~12자 영문 소문자 또는 숫자">
                                    <span>&nbsp;</span>
                                </td>
                                <td>
                                    <input type="button" id="duplicate" class="input" value="중복확인">
                                    <span>&nbsp;</span>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="row">
                    <label>Password</label>
                    <input type="password" name="user_pw" required class="input" placeholder="6~12자 영문 소문자/대문자/숫자">
                    <span>&nbsp;</span>
                </div>
                <div class="row">
                    <label>Password_Check</label>
                    <input type="password" id="user_pw_check" required class="input" placeholder="패스워드를 한번 더 입력해주세요">
                    <span>&nbsp;</span>
                </div>
                <div class="row">
                    <label>Name</label>
                    <input type="text" name="user_name" required class="input" placeholder="한글 2~10자">
                    <span>&nbsp;</span>
                </div>
                <div class="row">
                    <label>Phone</label>
                    <input type="text" name="user_phone" required class="input">
                    <span>&nbsp;</span>
                </div>
			</fieldset>
			<fieldset class="outbox">
                <legend>선택 입력 정보</legend>
			    <div class="row">
                    <label>Gender</label>
                    <div>
                    	<input type="radio" name="user_gender" class="input input-inline" value="" checked> 선택안함
                        <input type="radio" name="user_gender" class="input input-inline" value="M"> 남성
                        <input type="radio" name="user_gender" class="input input-inline" value="F"> 여성
                    </div>
                </div>
                <div class="row">
                    <label>Birth</label>
                    <input type="date" name="user_birth" class="input">
                </div>
			</fieldset>
			<div class="row">
				<input type="submit" value="회원가입" class="input">
			</div>
		</div>
	</form>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>