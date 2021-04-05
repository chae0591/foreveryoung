<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){

	})

</script>    
    
</head>


<body>
    	<form action ="/login" method="post">
        	<div >
            	<h1>로그인</h1>
                <input type="text"  name="admin_id" id="id" placeholder="아이디를 입력해주세요."><br>
            	<input type="password" name="admin_pw" id="password" placeholder="비밀번호를 입력해주세요."><br><br>
            	<input type="submit" value="로그인" >
        	</div> 
    	</form>
</body>
</html>