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
	<h2>상품 리스트</h2>
	<table border="1">
		<tr>
			<th align="center" width="100">상품 번호</th>
			<th align="center" width="100">삼품명</th>
			<th align="center" width="100">카테고리</th>
			<th align="center" width="100">브랜드</th>
			<th align="center" width="100">할인적용</th>
			<th align="center" width="200">상품가격/할인가격</th>
			<th align="center" width="160">등록일</th>
			<th align="center" width="100">재고수</th>
			<th align="center" width="100">판매수</th>
		</tr>
		
				<c:choose>
			<c:when test="${empty productList}">
				<tr>
					<td colspan="9">
						등록된 상품이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${productList}" var="productList">
					<tr>
						<td align="center">${productList.product_id}</td>
						<td align="center">${productList.product_name}</td>
						<td align="center">${productList.product_category}</td>
						<td align="center">${productList.brand_name}</td>
						<td align="center">할인적용 체크박스</td>
						<td align="center">${productList.product_price}/
						 					할인가격</td>
						<td align="center">${productList.product_regDate}</td>
						<td align="center">${productList.product_stock}</td>						
						<td align="center">판매수</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>