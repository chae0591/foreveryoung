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
		var formObj = $('#inquiryDetail')
		
		$("#inquiry_modify").click(function(){
			var inquiry_no = $("#inquiry_no");
			var inquiry_noVal = inquiry_no.val();
			self.location = "/service_center/inquiryModify?inquiry_no=" + inquiry_noVal
		})
		$("#inquiry_delete").click(function(){
			
			 window.alert("문의글이 삭제되었습니다.");
				formObj.attr("action" , "/service_center/inquiryDelete")
				formObj.submit();				 
		})
		
	})

</script> 
</head>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>

<h2>게시글 쓰기</h2>
	
	<div class="col-lg-12">
				<form:form modelAttribute="inquiryModify" action="inquiryModify" >
					<form:hidden path="inquiry_no"/>
					
							<p><form:input path="inquiry_title"/></p>
		
							<p><form:textarea cols="50" rows="5" path="notice_content"/></p>
					<form:hidden path="inquiry_regDate"/>
					<form:hidden path="user_num"/>
				</form:form>
				
				<div>
					<button type="submit" id="inquiry_complete">수정 완료</button>
					<button type="submit" id="inquiryList">목록으로</button>
				</div>
	</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>