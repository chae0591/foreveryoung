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
		<h2>브랜드 리스트</h2>
	<table border="1">
		<tr>
			<th align="center" width="100">브랜드 번호</th>
			<th align="center" width="100">브랜드 ID</th>
			<th align="center" width="100">브랜드  이름</th>
			<th align="center" width="160">전화번호</th>
			<th align="center" width="160">가입일</th>
			<th align="center" width="160"></th>
		</tr>
		
				<c:choose>
			<c:when test="${empty brandList}">
				<tr>
					<td colspan="6">
						브랜드 계정이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${brandList}" var="brandList">
					<tr>
						<td align="center">${brandList.brand_num}</td>
						<td align="center">${brandList.brand_id}</td>
						<td align="center">${brandList.brand_name}</td>
						<td align="center">${brandList.brand_phone}</td>
						<td align="center">
							<!--<javatime:format value="${brandList.brand_regDate}"
								pattern="yyyy-MM-dd"/>--></td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>