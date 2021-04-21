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
	height: 25px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/css/member/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	search_day = function(dayvalue){
		$.ajax({
			url : '/order/order_search_by_day',
			data : {dayval : dayvalue},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".contract-table").html(result);
			}
		});
	}
	
	$("#1day-btn").click(function(){
		search_day(1);
	});
	$("#7day-btn").click(function(){
		search_day(7);
	});
	$("#15day-btn").click(function(){
		search_day(15);
	});
	$("#30day-btn").click(function(){
		search_day(30);
	});
	
	$("#date-search-btn").click(function(){
		$.ajax({
			url : '/order/order_search_by_date',
			data : {
				start_date : $("input[name=date1]").val(), 
				end_date : $("input[name=date2]").val()
				},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".contract-table").html(result);
			}
		});
	});
	
	$("#search-btn").click(function(){
		$.ajax({
			url : '/order/order_search_by_target',
			data : {
				target : $("input[name=target]").val()
				},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".contract-table").html(result);
			}
		});
	})
	
});
</script>
</head>
<body>
<header>
<jsp:include page="../template/header.jsp"></jsp:include>
</header>
<section>
	<div class="container">
		<div class="row">
			<jsp:include page="mypagetemplate/mypagemenu.jsp"></jsp:include>
			<div class="col-md-10 col-lg-6">
				<div class="contentbox">
					<h2>결제 목록</h2>
					<div class="outbox">
						<div>
							<div>
								<button id="1day-btn">1일</button>
								<button id="7day-btn">1주일</button>
								<button id="15day-btn">15일</button>
								<button id="30day-btn">1개월</button>
							</div>
							
							<div>
								<input type="date" name="date1"> ~ <input type="date" name="date2">
							</div>
							<div><button id="date-search-btn">조회하기</button></div>
						</div>
						
						<table class="table contract-table">
							<thead>
								<tr>
									<th>날짜</th>
									<th></th>
									<th>상품정보</th>
									<th>상태</th>
									<th>확인신청</th>
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
											<td>
												<!-- <img class="pro-img img img-responsive" src="/viewImg?fileName=${order_product.image_save_name}&imageType=${order_product.image_type}"> -->
											</td>
											<td>
												<span>
													브랜드 : <c:out value="${order_product.brand_name}"></c:out> 
													상품 : <c:out value="${order_product.product_name}"></c:out><br>
													수량 : <c:out value="${order_product.order_amount}"></c:out> 
													결제 금액 :<fmt:formatNumber value="${order_product.order_totalPrice}" pattern="###,###,###"/>
												</span>
											</td>
											<td>
												<span><c:out value="${order_product.order_status}"></c:out></span>
											</td>
											<td><button>확인신청</button></td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						<div class="row">
							<div class="col-lg-offset-6 col-lg-6">
								<input type="text" name="target"> <button id="search-btn">검색</button>
							</div>
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