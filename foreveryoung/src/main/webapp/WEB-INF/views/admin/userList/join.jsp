<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	    <form action ="/userList/join" method="post">
        	
            	<h1>관리자 등록</h1>
            	<label>ID</label><br><br>
                <input type="text"  name="admin_id" id="id" placeholder="아이디를 입력해주세요."><br><br>
                
                <label>PASSWORD</label><br><br>
            	<input type="password" name="admin_pw" id="password" placeholder="비밀번호를 입력해주세요."><br><br>
            	
            	<label>NAME</label><br><br>
            	<input type="text" name="admin_name" id="name" placeholder="이릅을 입력해주세요"><br><br>
       
            	<label>PHONE</label><br><br>
            	<input type="text" name="admin_phone" id="phone" placeholder="이릅을 입력해주세요"><br><br>
            	
            	<input type="submit" value="가입하기">
        	
    	</form>
</body>
</html>