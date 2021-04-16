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
<style>
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
.inquiry-btn {
	width: 150px;
	height: 50px;
	color: #fff;
    font-weight: 700;
    border-radius: 5px;
    font-size: 18px;
    line-height: 30px;
}
</style>

<script>
$(document).ready(function() {
		
	//1:1버튼 클릭시
	$(".inquiryGobtn").click(function(){
		var id = "${check}";
			
	    if(id == ''){
	        alert("로그인 후 문의 가능합니다.");
	        location.href = '/member/login';
	   	}else{
	   	 	location.href = '/service_center/inquiryRegister';
	    }
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
		<a href="/service_center/notice"><button class="notice-btn">공지사항</button></a>
		<a href="/service_center/inquiry"><button class="inquiry-btn">1:1 문의</button></a>
	</div>
	
	<div class="col-lg-12">
				<form:form modelAttribute="inquiryDetail">
					<form:hidden path="inquiry_no"/>
		
						<table border="1">
							<tr>
								<th align="center" width="100">제목</th>
								<td><form:input path="inquiry_title" readonly="true"/></td>
							</tr>
							<tr>
								<th align="center" width="100">작성자</th>
								<td><form:input path="user_id" readonly="true"/></td>
							</tr>
							<tr>
								<th align="center" width="100">등록일</th>
								<td><form:input path="inquiry_regDate" readonly="true"/></td>			
							</tr>
							<tr>
								<th align="center" width="100">문의 내용</th>
								<td><form:input path="inquiry_content" readonly="true"/></td>			
							</tr>
							
						</table>			
					<form:hidden path="user_num"/>
				</form:form>
		</div>
		
		<div>
			<c:out value="${inquiryDetail.reply_content}"></c:out>
		</div>
	<div>
		<button type="submit" id="btnModify">수정</button>
		<button type="submit" id="btnList">게시글 보기</button>
		<button type="submit" id="btnRemove">게시글 삭제</button>
	</div>
	
	<div class="last-box">
		<button class="inquiryGobtn">1:1 문의하기</button>
	</div>
	
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>