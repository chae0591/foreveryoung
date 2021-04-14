<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

<script>
$(document).ready(function(){
	
	$(".cancel-btn").click(function(){
		 location.href = '/service_center/inquiry';
	});
});

</script> 

</head>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>

<div class="register-box">
	<form action ="inquiryRegister" method="post">
		<div>
		     <h1>1:1문의글 등록</h1>
		</div>
		       
		<div>
		     <label>제목</label><br><br>
		     <input type="text" name="inquiry_title" id="inquiry_title">
		</div>
		            	
		<div>
		     <label>문의내용</label><br><br>
		     <textarea name="inquiry_content" id="inquiry_content"></textarea>
		</div>
		            	
		<div>
		     <input type="submit" value="등록">
		     <input type="button" class="cancel-btn" value="취소">
		</div>
	</form>
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>