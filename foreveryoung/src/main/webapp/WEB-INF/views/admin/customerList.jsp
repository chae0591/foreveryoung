<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<h2>고객 리스트</h2>
	<table border="1">
		<tr>
			<th align="center" width="100">고객 번호</th>
			<th align="center" width="100">고객  ID</th>
			<th align="center" width="100">고객 이름</th>
			<th align="center" width="160">전화번호</th>
			<th align="center" width="160">생년월일</th>
			<th align="center" width="160">가입일</th>
		</tr>
		
				<c:choose>
			<c:when test="${empty customerList}">
				<tr>
					<td colspan="6">
						고객 계정이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${customerList}" var="customerList">
					<tr>
						<td align="center">${customerList.user_num}</td>
						<td align="center">${customerList.user_id}</td>
						<td align="center">${customerList.user_name}</td>
						<td align="center">${customerList.user_phone}</td>
						<td align="center">${customerList.user_birth}</td>
						<td align="center">${customerList.user_regDate}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>