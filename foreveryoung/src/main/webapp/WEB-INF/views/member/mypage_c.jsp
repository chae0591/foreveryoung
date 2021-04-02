<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>

</script>
</head>
<body>
	<div class="outbox" style="width: 1000px;">
		<div class="leftButtons">
			<ul>
				<li>주문 내역</li>
				<li>장바구니</li>
				<li>관심등록</li>
				<li>내가 쓴 글</li>
				<li>내 설정</li>
			</ul>
		</div>
		<div class="content">
			<h3><c:out value="${check}"></c:out></h3>
			<h3><c:out value="${auth}"></c:out></h3>
			<h3><c:out value="${user_info}"></c:out></h3>
			<h3><c:out value="${user_info.user_num}"></c:out></h3>
			<h3><c:out value="${user_info.user_name}"></c:out></h3>
		</div>
	</div>
</body>
</html>