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
	<h2>1:1문의 리스트</h2>
	<table border="1">
		<tr>
			<th align="center" width="100"> 번호</th>
			<th align="center" width="100">제목</th>
			<th align="center" width="100">작성자</th>
			<th align="center" width="100">등록일</th>
			<th align="center" width="100">상태</th>

		</tr>

		<c:choose>
			<c:when test="${empty inquiryList}">
				<tr>
					<td colspan="5">1:1문의가  없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>s
				<c:forEach items="${inquiryList}" var="inquiryList">
					<tr>
						<td align="center">${inquiryList.inquiry_no}</td>
						<td align="center">${inquiryList.inquiry_title}</td>
						<td align="center">${inquiryList.user_id}</td>
						<td align="center">${inquiryList.inquiry_regDate}</td>
						<td align="center">
							<a href="/admin/inquiryDetail?inquiry_no=${inquiryList.inquiry_no}">
							${inquiryList.inquiry_status}</a> 
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>