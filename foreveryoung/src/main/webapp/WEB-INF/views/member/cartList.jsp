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
	<div class="outbox" style="width: 750px">
		<h2>장바구니</h2>
		<c:if test="${empty userCartList}">
			<h5>비었다!</h5>
		</c:if>
	</div>
</body>
</html>