<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<thead>
	<tr>
		<th>날짜</th>
		<th style="width: 30%">제목</th>
		<th></th>
		<th style="width: 30%">상품</th>
		<th>별점</th>
	</tr>
</thead>
<tbody>
	<c:choose>
		<c:when test="${empty review_info}">
			<tr>
				<th colspan="5">남기신 리뷰가 없습니다.</th>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="review" items="${review_info}">
			<tr>
				<td><span><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd"/></span></td>
				<td style="width: 40%">${review.review_title}</td>
				<c:choose>
					<c:when test="${empty review.image_save_name}">
						<td><img src="https://dummyimage.com/50x50/000/fff&text=foreveryoung"></td>
					</c:when>
					<c:otherwise>
						<td>
						<img class="pro-img img img-responsive" src="/viewImg?fileName=${review.image_save_name}&imageType=${review.image_type}">
						</td>
					</c:otherwise>
				</c:choose>
				<td style="width: 40%">
					브랜드 : ${review.brand_name} <br> 
					<a href="/detail_board/detail_main?product_no=${review.product_no}">상품 : ${review.product_name}</a>
				</td>
				<td>${review.review_score} / 5</td>
			</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>