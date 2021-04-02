<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	    <form action ="join" method="post">
        	<div>
        		<h1>관리자 등록</h1>
        	</div>
            	
            <div>
            	<label>ID</label><br><br>
                <input type="text"  name="admin_id" id="id" placeholder="아이디를 입력해주세요."><br><br>
			</div>
				
           	<div>
                <label>PASSWORD</label><br><br>
            	<input type="password" name="admin_pw" id="password" placeholder="비밀번호를 입력해주세요."><br><br>
            </div>
            	
            <div>
            	<label>NAME</label><br><br>
            	<input type="text" name="admin_name" id="name" placeholder="이릅을 입력해주세요"><br><br>
       		</div>
       			
       			
       		<div>
            	<label>PHONE</label><br><br>
            	<input type="text" name="admin_phone" id="phone" placeholder="이릅을 입력해주세요"><br><br>
            </div>
            	
            	
            <div>
            	<input type="submit" value="가입하기">
        	</div>
        	
    	</form>
</body>
</html>