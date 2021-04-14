<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

</head>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>

<h2>게시글 쓰기</h2>
	
	<form:form modelAttribute="inquiry" action="register">
		<table>
			<tr>
				<td>제목</td>
				<td><form:input path="title"/></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td><form:input path="writer"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><form:input path="content"/></td>
			</tr>
		</table>
	</form:form>
	
	<div>
		<button type="submit" id="btnRegister">등록</button>
		<button type="submit" id="btnList">게시글 보기</button>
	</div>

<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>