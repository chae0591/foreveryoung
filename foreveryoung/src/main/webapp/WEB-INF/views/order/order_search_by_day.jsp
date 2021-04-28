<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<thead>
	<tr>
		<th>날짜</th>
		<th></th>
		<th>상품정보</th>
		<th>배송지</th>
		<th>상태</th>
	</tr>
</thead>
<tbody>
	<c:choose>
		<c:when test="${empty product_info}">
		<tr>
			<td colspan="5">주문 내역이 없습니다.</td>
		</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="order_product" items="${product_info}">
				<tr>
				<td>
					<span><fmt:formatDate value="${order_product.order_time}" pattern="yyyy-MM-dd"/></span>
				</td>
				<c:choose>
					<c:when test="${empty order_product.image_save_name}">
						<td><img src="https://dummyimage.com/50x50/000/fff&text=foreveryoung"></td>
					</c:when>
					<c:otherwise>
						<td>
						<img class="pro-img img img-responsive" src="/viewImg?fileName=${order_product.image_save_name}&imageType=${order_product.image_type}">
						</td>
					</c:otherwise>
				</c:choose>
				<td>
					<span>
						브랜드 : <c:out value="${order_product.brand_name}"></c:out> 
						상품 : <c:out value="${order_product.product_name}"></c:out><br>
						수량 : <c:out value="${order_product.order_amount}"></c:out> 
						결제 금액 :<fmt:formatNumber value="${order_product.order_totalPrice}" pattern="###,###,###"/>
					</span>
				</td>
				<td>
					<c:out value="${order_product.address_jibun}"/>
					<c:if test="${!empty order_product.address_detail}">
					,<c:out value="${order_product.address_detail}"/>
					</c:if>
				</td>
				<td><span><c:out value="${order_product.order_status}"></c:out></span></td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>