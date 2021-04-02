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
	<h2>공지사항 리스트</h2>
	<table border="1">
		<tr>
			<th align="center" width="100">공지글 번호</th>
			<th align="center" width="100">분류</th>
			<th align="center" width="100">제목</th>
			<th align="center" width="100"></th>

		</tr>
		
				<c:choose>
			<c:when test="${empty noticeList}">
				<tr>
					<td colspan="4">
						공지사항이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${noticeList}" var="noticeList">
					<tr>
						<td align="center">${noticeList.notice_no}</td>
						<td align="center">${noticeList.notice_type}</td>
						<td align="center">${noticeList.notice_title}</td>						
						<td align="center">상세보기</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>	
</body>
</html>