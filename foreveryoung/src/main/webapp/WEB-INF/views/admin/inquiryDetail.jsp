<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2> 1:1문의 답변하기</h2>
	
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
			<form:hidden path="inquiry_status"/>
			<form:hidden path="user_num"/>
			
			
		</form:form>

		
		<button id="notice_modify">수정</button>
		<button id="notice_delete">삭제</button>
	
</body>
</html>