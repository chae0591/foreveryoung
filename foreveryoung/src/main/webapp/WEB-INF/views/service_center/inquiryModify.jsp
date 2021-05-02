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
.modify-box {
	width: 800px;
	height: auto;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 30px;
	position:relative;
	display: block;
}
.modify-contentBox {
	position:relative;
	width: 100%;
	height: auto;
	display: block;
}
 p {
	margin-bottom: 5px;
	font-size: 16px;
	font-weight: 400;
	text-align: left;
}

.modify_header {
	width: 100%;
	height: auto;
	margin-bottom: 30px;
	text-align: center;
	padding: 0;
}
.title-box {
	width: 100%;
	height: auto;
	margin-bottom: 15px;
	text-align: center;
	padding: 0;
	display: block;
}
.title-box input{
	width: 100%;
	height: 30px;
}
.content-box {
	width: 100%;
	height: auto;
	margin-bottom: 30px;
	text-align: center;
	padding: 0;
	display: block;
}
.btnModifyDone {
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
.btnGoList, .btnModifyCancel {
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
	width: 100%;
	height: auto;
	text-align: center;
	display: inline-block;
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
	
		//목록으로 버튼 클릭시
		$(".btnGoList").click(function(){
			location.href = '/service_center/inquiry';
		});
		
		//수정취소 버튼 클릭시
		$(".btnModifyCancel").click(function(){
			 history.go(-1);
		});
		
		//수정 완료 버튼
		$(".btnModifyDone").click(function(){
			var formObj = $('#inquiryModify')
			
			formObj.attr("action", "/service_center/inquiryModify")
			formObj.attr("method" , "post")
			formObj.submit();			 
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

<div class="modify-box">
	<div class="modify_header">
		 <h1>게시글 수정</h1>
	</div>
	
	<div class="modify-contentBox">
		<form:form modelAttribute="inquiryModify" action="inquiryModify" >
			<form:hidden path="inquiry_no"/>
				
			<div class="title-box">	
				<p>제목</p>
				<form:input path="inquiry_title" class="input-title"/>
			</div>
			
			<div class="content-box">
				 <p>문의내용</p>
				<form:textarea path="inquiry_content" style="width:100%;height:300px;border:1;overflow:visible;text-overflow:ellipsis;resize: none;"/>
			</div>
			
				<form:hidden path="inquiry_regDate"/>
				<form:hidden path="user_num"/>
		</form:form>
	</div>
			
	<div class="option-box">
		<button class="btnGoList">목록으로</button>
		<button class="btnModifyCancel">수정 취소</button>
		<button type="submit" class="btnModifyDone">수정 완료</button>
	</div>
	
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>