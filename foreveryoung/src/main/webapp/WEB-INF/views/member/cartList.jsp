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
<script>
	$(document).ready(function(){
		function stringNumberToInt(stringNumber){
		    return parseInt(stringNumber.replace(/,/g , ''));
		}
		
		function commaNum(num) {
			var len, point, str;
			num = num + "";
			point = num.length % 3;
			len = num.length;
			
			str = num.substring(0, point);
			while (point < len) {
				if (str != "") str += ",";
				str += num.substring(point, point + 3);
				point += 3;
			}
			return str;
		}
		
		$("#totalcheck").change(function(){
			var checkval = $(this).prop("checked");
			$(".cartitemcheck").prop("checked", checkval);
			$("input[class=cartitemcheck]").change();
		});
		
		$(".del-cart-item").click(function(){
			if(confirm("정말로 삭제하시겠습니까?")) {
				var cart_no = $(this).prev().text();
				var del_row = $(this).parent().parent();
				
				$.ajax({
					url : "cart_item_del",
					type : "get",
					data : {
						cart_no : cart_no
					},
					success : function(resp) {
						del_row.remove();
					}
				});
			}
		});
		
		$(".del-cart-btn").click(function(){
			if(confirm("정말로 삭제하시겠습니까?")) {
				var cart_no_array = [];
				
				$('input[class="cartitemcheck"]:checked').each(function(){
					cart_no_array.push($(this).val());
				});
				
				if(cart_no_array.length == 0) {
					alert("삭제할 상품을 1개 이상 선택해주세요");
					return;
				}
				
				$.ajax({
					url : "cart_item_del",
					type : "post",
					traditional : true,
					data : {
						cartArr : cart_no_array
					},
					success : function(resp) {
						$('input[class="cartitemcheck"]:checked').each(function(){
							$(this).parent().parent().remove();
						});
					}
				});
			}
		});
		
		<!-- 합계 구하기 -->
		var checkCountval = 0;
		var sale_price = 0;
		var total_price = 0;
		
		$("input[class=cartitemcheck]").change(function(){
			var sum_price = 0;
			checkCountval = $('input[class="cartitemcheck"]:checked').length;
			$('input[class="cartitemcheck"]:checked').each(function(){
				var price_temp = $(this).parent().next().next().children(".pp").children().text();
				var product_price = stringNumberToInt(price_temp);
				var cart_count = $(this).parent().next().next().children(".cc").children().text();
				sum_price += product_price * cart_count;
			});
			total_price = sum_price - sale_price;
			
			$("#checkCount").text(checkCountval);
			$("#sumPrice").text(sum_price);
			$("#salePrice").text(sale_price);
			$("#totalPrice").text(total_price);
			
			$(".format-money").each(function(){
				$(this).text(commaNum($(this).text()));
			});
		});
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
		<div class="col-md-8">
			<div class="outbox">
				<h2>장바구니</h2>
				
				<c:choose>
					<c:when test="${empty userCartList}">
					<h5>장바구니에 표시할 품목이 없습니다!</h5>
					</c:when>
					<c:otherwise>
						<input type="checkbox" id="totalcheck"><label for="totalcheck">전체 선택</label>
						<input type="button" class="input input-inline del-cart-btn" value="선택 삭제">
						<form action="/order/ordertest_cart" method="get">
						<table class="table">
							<thead>
								<tr>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="cartItem" items="${userCartList}">
									<tr>
										<td><input type="checkbox" class="cartitemcheck" name="cartList" value="${cartItem.cart_no}"></td>
										<c:choose>
											<c:when test="${empty cartItem.image_save_name}">
												<td><img src="https://dummyimage.com/50x50/000/fff&text=foreveryoung"></td>
											</c:when>
											<c:otherwise>
												<td>
												<img class="pro-img img img-responsive" src="/viewImg?fileName=${cartItem.image_save_name}&imageType=${cartItem.image_type}">
												</td>
											</c:otherwise>
										</c:choose>
										<td colspan="5">
											<span>${cartItem.brand_name}</span>
											<span>${cartItem.product_name}</span>
											<div class="pp">가격 : <span><fmt:formatNumber value="${cartItem.product_price}" pattern="###,###,###"/></span> 원</div>
											<div class="cc">주문 수량 : <span>${cartItem.cart_count}</span></div>
										</td>
										<td><span class="hidden-cart-no" style="display: none;">${cartItem.cart_no}</span><input type="button" class="del-cart-item" value="X"></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
								<tr>
									<td colspan="2">
										체크된 항목 계산 (얼마인지)
									</td>
									<td>선택 수 : <span id="checkCount">0</span> 개</td>
									<td>선택 가격 합 : <span id="sumPrice" class="format-money">0</span> 원</td>
									<td>세일 : <span id="salePrice" class="format-money">0</span></td>
									<td>토탈 가격 : <span id="totalPrice" class="format-money">0</span> 원</td>
									<td><input type="submit" class="order-btn" value="구매하기"></td>
								</tr>
							</tfoot>
						</table>
						</form>
					</c:otherwise>
				</c:choose>
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