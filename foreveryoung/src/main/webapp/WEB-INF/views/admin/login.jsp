<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/admin/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>


<script>

$(document).ready(function(){

})

</script> 

<style>

	.form-control,
	.btn-primary {
	  width: 400px;
	  margin: 0 auto;
	}
	
	.container {
	 margin: 200px auto;
	}

</style>
   
    
</head>


<body>
	<h2>foreveryoung</h2>
	<a class="navbar-brand" href="/main" style="float:right;">home</a>

	<div class="container text-center">
    	<form action ="login" method="post">
        	<div>
            	<span>관리자 로그인</span> <br><br>
            	
            	<label>ID</label>
                <input type="text"  name="admin_id" id="admin_id" class="form-control" maxlength="12" placeholder="아이디를 입력해주세요." required="required"><br>
            	<label>Password</label>
            	<input type="password" name="admin_pw" id="admin_pw" class="form-control" maxlength="12" placeholder="비밀번호를 입력해주세요." required="required"><br><br>
		        <c:if test="${not empty param.error}">
		        	<div style="color:red; margin-left:-200px">입력한 정보가 맞지 않습니다.</div>
		        </c:if>
            	<input type="submit" value="로그인"   class="btn btn-primary" >
        	</div> 
    	</form>	
	</div>



</body>
</html>