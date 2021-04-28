<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/css/bootstrap.css">
<style>
.pro-img{
	height: 50px;
	width: 50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/css/member/js/bootstrap.js"></script>


<c:set var="count1" value="0"></c:set>
<c:set var="count2" value="0"></c:set>
<c:set var="count3" value="0"></c:set>
<c:set var="count4" value="0"></c:set>
<c:set var="count5" value="0"></c:set>
<c:forEach var="count" items="${order_info}">
	<c:choose>
		<c:when test="${count.order_status eq '결제'}">
			<c:set var="count1" value="${count1 + 1}"></c:set>
		</c:when>
		<c:when test="${count.order_status eq '배송진행'}">
			<c:set var="count2" value="${count2 + 1}"></c:set>
		</c:when>
		<c:when test="${count.order_status eq '배송완료'}">
			<c:set var="count3" value="${count3 + 1}"></c:set>
		</c:when>
		<c:when test="${count.order_status eq '주문취소'}">
			<c:set var="count4" value="${count4 + 1}"></c:set>
		</c:when>
		<c:when test="${count.order_status eq '반품교환'}">
			<c:set var="count5" value="${count5 + 1}"></c:set>
		</c:when>
		<c:otherwise></c:otherwise>
	</c:choose>
</c:forEach>
</head>
<body>
<header>
<jsp:include page="../template/header.jsp"></jsp:include>
</header>
<section>
	<div class="container">
		<div class="row">
			<jsp:include page="mypagetemplate/mypagemenu.jsp"></jsp:include>
			<div class="col-md-8">
				<div class="contentbox">
					<div class="row">
						<h5>번호 : <c:out value="${check}"></c:out></h5>
						<h5>권한 : <c:out value="${auth}"></c:out></h5>
						<h5>이름 : <c:out value="${user_info.user_name}"></c:out></h5>
						<h5>고객님 이용해 주셔서 감사합니다.</h5>
					</div>
					<div class="row">
						<h2>주문 / 배송 조회</h2>
						<table class="table">
							<thead>
								<tr>
									<th>결제</th>
									<th>배송진행</th>
									<th>배송완료</th>
									<th>주문취소</th>
									<th>반품/교환</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><c:out value="${count1}"></c:out></td>
									<td><c:out value="${count2}"></c:out></td>
									<td><c:out value="${count3}"></c:out></td>
									<td><c:out value="${count4}"></c:out></td>
									<td><c:out value="${count5}"></c:out></td>
								</tr>
							</tbody>
						</table>
					</div>
					
					<div class="row">
						<h2>최근 주문내역</h2>
						
						<table class="table">
							<thead>
								<tr>
									<th>날짜</th>
									<th></th>
									<th style="width: 70%">상품 정보</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty product_info}">
										<tr>
											<th colspan="3"><span>최근 주문 내역이 없습니다.</span></th>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="order_product" items="${product_info}">
										<tr>
											<td><span><fmt:formatDate value="${order_product.order_time}" pattern="yyyy-MM-dd"/></span></td>
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
												브랜드 : <span><c:out value="${order_product.brand_name}"></c:out> 
												상품 : <c:out value="${order_product.product_name}"></c:out><br>
												수량 : <c:out value="${order_product.order_amount}"></c:out> 
												결제 금액 :<fmt:formatNumber value="${order_product.order_totalPrice}" pattern="###,###,###"/></span>
											</td>
											<td>
												<span><c:out value="${order_product.order_status}"></c:out></span>
											</td>
										</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					
					<div class="row">
						<h2>상담 신청내역</h2>
						<table class="table">
							<thead>
								<tr>
									<th>날짜</th>
									<th style="width: 70%">제목</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty inquiry_info}">
										<tr>
											<th colspan="3">최근 문의 사항이 없습니다.</th>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="inq" items="${inquiry_info}">
											<tr>
												<td><c:out value="${inq.inquiry_regDate}"></c:out></td>
												<td><a href="/service_center/inquiryDetail?inquiry_no=${inq.inquiry_no}"><c:out value="${inq.inquiry_title}"></c:out></a></td>
												<td>
													<c:choose>
														<c:when test="${inq.reply_no eq 0}">
															처리중 
														</c:when>
														<c:otherwise>
															답변 완료
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
					</div>
					
					<div class="row">
						<div class="col-md-4">
							<h3>배송지</h3>
							<span>
							<c:choose>
								<c:when test="${empty address_info}">
									기본 배송지가 등록되어 있지 않습니다.
								</c:when>
								<c:otherwise>
									${address_info.address_name}<br>
									[${address_info.address_zonecode}]<br>
									${address_info.address_jibun}, ${address_info.address_detail}<br>
									${address_info.address_phone}<br>
								</c:otherwise>
							</c:choose>
							</span>
						</div>
						<div class="col-md-4">
							<h3>연락처</h3>
							<span><c:out value="${user_info.user_phone}"></c:out></span>
						</div>
						<div class="col-md-4">
							<h3>세부정보</h3>
							<span>성별 : 
							<c:choose>
								<c:when test="${user_info.user_gender eq 'M'}">남</c:when>
								<c:when test="${user_info.user_gender eq 'F'}">여</c:when>
								<c:otherwise></c:otherwise>
							</c:choose></span><br>
							<span>생일 : <fmt:formatDate value="${user_info.user_birth}" pattern="yyyy-MM-dd"/></span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<footer>
<jsp:include page="../template/footer.jsp"></jsp:include>
</footer>
</body>

</html>		