<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>     

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<style type="text/css">
.banner {
	text-align: center;
	min-width: 1020px;
	height: 100px;
	background-color: #dddddd;
}
.banner-title {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
}
.banner-title  h2, p{
	float: left;
	position: inline-box;
	padding-top: 20px;
	margin-right: 10px;
}
.service-btns {
    padding: 0;
    width: 1020px;
    height:55px;
	text-align: center;
	margin:0 auto;
	margin-bottom:20px;
	margin-top: 20px;
}
.service-btns button{
    width: 50%;
	height:100%;
	text-align: center;
	float: left;
	position: relative;
	font-size: 20px;
	font-weight: 500;
	border-radius: 5px;
}
.inquiry-btn {
	background-color: #555;
	color: #fff;
}
.service-btns button:hover {
	background-color: #555;
	color: #fff;
}
.register-box {
	width: 800px;
	height: auto;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 30px;
	position:relative;
}
.register_header {
	text-align: center;
}
 p {
	margin-bottom: 5px;
	font-size: 16px;
	font-weight: 400;
	text-align: left;
}

.register_header, .content-box{
	width: 100%;
	height: auto;
	margin-bottom: 30px;
	text-align: center;
}
.title-box {
	width: 100%;
	height: auto;
	margin-bottom: 15px;
	text-align: center;
}
.title-box input{
	width: 100%;
	height: 30px;
}
.register-btn {
	width: 150px;
	height: 50px;
	color: #fff;
    font-weight: 700;
    border-radius: 5px;
    font-size: 18px;
    line-height: 30px;
    background-color: #00C8F5;
    border: 0;
    outline: 0;
}
.cancel-btn {
	width: 150px;
	height: 50px;
	color: #fff;
    font-weight: 700;
    border-radius: 5px;
    font-size: 18px;
    line-height: 30px;
    background-color: #555;
    border: 0;
    outline: 0;
}
.option-box {
	text-align: center;
}
</style>
<script>
$(document).ready(function(){
	
	//공지사항으로 이동
	$(".notice-btn").click(function(){
   			location.href = '/service_center/notice';
	});
	
	//1:1문의로 이동
	$(".inquiry-btn").click(function(){
		var id = "${check}";
		
        if(id == ''){
        	 alert("로그인 후 문의 가능합니다.");
        	 location.href = '/member/login';
   		 }else{
   			 location.href = '/service_center/inquiry';
    	}
	});
	
	//취소버튼 클릭시
	$(".cancel-btn").click(function(){
		 location.href = '/service_center/inquiry';
	});
});

</script> 

</head>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>

<div class="banner">
	<div class="banner-title">
		<h2>고객센터</h2>
		<p>무엇을 도와드릴까요?</p>
	</div>
</div>
		
<div class="service-btns">
	<button class="notice-btn">공지사항</button>
	<button class="inquiry-btn">1:1 문의</button>
</div>

<div class="register-box">
	<form action ="inquiryRegister" method="post">
		<div class="register_header">
		     <h1>1:1문의글 등록</h1>
		</div>
		       
		<div class="title-box">
		     <p>제목</p>
		     <input type="text" name="inquiry_title" id="inquiry_title"  placeholder="제목을 입력해주세요">
		</div>
		            	
		<div class="content-box">
		      <p>문의내용</p>
		     <textarea name="inquiry_content" id="inquiry_content"  placeholder="문의내용을 입력해주세요"   style="width:100%;height:300px;border:1;overflow:visible;text-overflow:ellipsis;resize: none;"></textarea>
		</div>
		            	
		<div class="option-box">
		     <input type="submit" value="등록" class="register-btn">
		     <input type="button" class="cancel-btn" value="취소">
		</div>
	</form>
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>