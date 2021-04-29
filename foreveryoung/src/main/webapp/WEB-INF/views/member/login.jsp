<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/css/bootstrap.css">
<style>
#login .container #login-row #login-column #login-box {
  margin: 0 auto;
  max-width: 600px;
  border: 1px solid #9C9C9C;
  background-color: #EAEAEA;
}
#login .container #login-row #login-column #login-box #login-form {
  padding: 20px;
}
</style>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/css/member/js/bootstrap.js"></script>
<script>
   $(document).ready(function () {
	var formObj = $("#login-form");
	
	$(".login-btn").on("click", function () {
		if(!$(".login-id").val()){
			window.alert("아이디를 입력하세요");
			$(".login-id").focus();
			return;
		}
		
		if(!$(".login-pw").val()){
			window.alert("비밀번호를 입력하세요");
			$(".login-pw").focus();
			return;
		}
		
		if($("input:radio[value='customer']").is(":checked")) {					
			formObj.attr("action", "/member/login_customer");
			formObj.attr("method", "post");
			formObj.submit();
		}
		else if($("input:radio[value='seller']").is(":checked")) {
			$(".login-id").attr("name", "brand_id");
			$(".login-pw").attr("name", "brand_pw");
			
			formObj.attr("action", "/member/login_brand");
			formObj.attr("method", "post");
			formObj.submit();
		}
	});
	
	$("#join_btn").click(function(){
		self.location = "/member/join";
	});
	
	$("#brand_join_btn").click(function(){
		self.location = "/member/join_brand";
	});
});
</script>
</head>
<body>
<header>
<jsp:include page="../template/header.jsp"></jsp:include>
</header>
<section>
<div id="login">
	<div class="container">
		<div id="login-row" class="row justify-content-center align-items-center">
			<div id="login-column" class="col-md-6 col-md-offset-3">
				<div id="login-box" class="col-md-12">
					<input type="radio" name="login_type" value="customer" checked="checked" id="check_cu"> <label for="check_cu">구매회원</label>
	    			<input type="radio" name="login_type" value="seller" id="check_br"> <label for="check_br">판매회원</label>
	    			
	    			<form action="sample" method="post" id="login-form" class="form">
	    				<h3 class="text-center text-info">ForeverYoung Login</h3>
	    				
	    				<div class="form-group">
                            <label for="username" class="text-info">Username:</label><br>
                            <input type="text" class="login-id form-control" name="user_id" id="username" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="userpassword" class="text-info">Password:</label><br>
                            <input type="password" class="login-pw form-control" name="user_pw" id="userpassword" required>
                        </div>
                        
                        <input type="button" value="로그인" class="login-btn btn btn-md btn-primary">
				        <c:if test="${not empty param.error}">
				        	<div><span style="color:red;">입력한 정보가 맞지 않습니다.</span></div>
				        </c:if>
				        <hr>
				        <input type="button" value="구매회원가입" class="join-btn btn btn-outline-secondary" id="join_btn">
				        <input type="button" value="판매회원가입" class="join-btn btn btn-outline-secondary" id="brand_join_btn">
	    			</form>
				</div>
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