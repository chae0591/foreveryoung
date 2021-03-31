<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product board</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
</head>
<body>
	<h2>상품 목록</h2>
	<table style="border:1px solid #ccc">
		<colgroup>
			<col width="10%" />
			<col width="*" />
			<col width="15%" />
			<col width="20%" />
		</colgroup>
		
		<thead>
			<tr>
				<th scope="col">카테고리 </th>
				<th scope="col">상품 이름</th>
				<th scope="col">상품 이미지</th>
				<th scope="col">상품 가격</th>
				<th scope="col">상품 재고</th>
				<th scope="col">상품 등록일</th>
			</tr>
		</thead>
		
		<tbody>
			<c:choose>
				<c:when test="${fn:length(list) > 0}"> 
					<c:forEach items="${list}" var="row">
					 <tr> 
						 <td>${row.PRODUCT_CATEGORY}</td> 
						 <td>${row.PRODUCT_NAME}</td>
				 		 <td>${row.PRODUCT_IMG}</td>
				 		 <td>${row.PRODUCT_PRICE}</td>
				 		 <td>${row.PRODUCT_STOCK}</td>
				 		 <td>${row.PRODUCT_REGDATE}</td>
				 	</tr> 
				   </c:forEach> 
			   </c:when>
				   
				<c:otherwise> 
					<tr> 
						<td colspan="4">조회된 결과가 없습니다.</td>
					</tr>
				 </c:otherwise>

			</c:choose>
								
		</tbody>
		
	</table>
</body>
</html>