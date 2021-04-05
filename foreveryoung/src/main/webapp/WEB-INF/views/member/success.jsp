<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>test</h1>
	
	<c:choose>
		<c:when test="${param.test == 1}">
			<h2>구매 회원 가입 성공</h2>
		</c:when>
		<c:when test="${param.test == 2}">
			<h2>판매 회원 가입 성공</h2>
		</c:when>
		<c:when test="${param.test == 3}">
			<h2>로그인 성공</h2>
			<h3><c:out value="${check}"></c:out></h3>
			<h3><c:out value="${auth}"></c:out></h3>
		</c:when>
		<c:otherwise>
			<h2>테스트 중입니다.</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>