<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>관리자 리스트</h2>
	<table border="1">
		<tr>
			<th align="center" width="100">관리자번호</th>
			<th align="center" width="100">관리자ID</th>
			<th align="center" width="100">관리자 이름</th>
			<th align="center" width="160">전화번호</th>
			<th align="center" width="160">등록일</th>
			<th align="center" width="160"></th>
		</tr>
		
				<c:choose>
			<c:when test="${empty adminList}">
				<tr>
					<td colspan="6">
						관리자 계정이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${adminList}" var="adminList">
					<tr>
						<td align="center">${adminList.admin_no}</td>
						<td align="center">${adminList.admin_id}</td>
						<td align="center">${adminList.admin_name}</td>
						<td align="center">
							<javatime:format value="${adminList.admin_regDate}"
								pattern="yyyy-MM-dd"/>
						</td>
						<td align="center">${adminList.admin_phone}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>