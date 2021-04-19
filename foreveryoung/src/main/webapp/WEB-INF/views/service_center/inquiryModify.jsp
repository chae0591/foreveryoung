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
<script>
$(document).ready(function(){
		
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

<h2>게시글 쓰기</h2>
	
	<div class="col-lg-12">
				<form:form modelAttribute="inquiryModify" action="inquiryModify" >
					<form:hidden path="inquiry_no"/>
					
							<p><form:input path="inquiry_title"/></p>
		
							<p><form:textarea cols="50" rows="5" path="inquiry_content"/></p>
					<form:hidden path="inquiry_regDate"/>
					<form:hidden path="user_num"/>
				</form:form>
	</div>		
	<div>
		<button class="btnGoList">목록으로</button>
		<button class="btnModifyCancel">수정 취소</button>
		<button type="submit" class="btnModifyDone">수정 완료</button>
	</div>

<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>