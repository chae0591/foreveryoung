<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/common.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		$("#totalcheck").change(function(){
			var checkval = $(this).prop("checked");
			$(".cartitemcheck").prop("checked", checkval);
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
				var product_price = $(this).parent().next().children(".pp").children().text();
				var cart_count = $(this).parent().next().children(".cc").children().text();
				sum_price += product_price * cart_count;
			});
			total_price = sum_price - sale_price;
			
			$("#checkCount").text(checkCountval);
			$("#sumPrice").text(sum_price);
			$("#salePrice").text(sale_price);
			$("#totalPrice").text(total_price);
		});
		
	});
</script>
</head>
<body>
	<div class="outbox" style="width: 750px">
		<h2>장바구니</h2>
		
		<c:choose>
			<c:when test="${empty userCartList}">
				<h5>장바구니에 표시할 품목이 없습니다!</h5>
			</c:when>
			<c:otherwise>
				<input type="checkbox" id="totalcheck"><label for="totalcheck">전체 선택</label>
				<input type="button" class="input input-inline del-cart-btn" value="선택 삭제">
				<table>
					<tbody>
						<c:forEach var="cartItem" items="${userCartList}">
							<tr>
								<td><input type="checkbox" class="cartitemcheck" value="${cartItem.cart_no}"></td>
								<td>
									<div>${cartItem.brand_name}</div>
									<div>${cartItem.product_name}</div>
									<div class="pp">가격 : <span>${cartItem.product_price}</span></div>
									<div class="cc">주문 수량 : <span>${cartItem.cart_count}</span></div>
								</td>
								<td><span class="hidden-cart-no" style="display: none;">${cartItem.cart_no}</span><input type="button" class="del-cart-item" value="X"></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td>
								체크된 항목 계산 (얼마인지)
							</td>
							<td>선택 수 : <span id="checkCount">0</span></td>
							<td>선택 가격 합 : <span id="sumPrice">0</span></td>
							<td>세일 (지금은 0)<span id="salePrice">0</span></td>
							<td>토탈 가격 : <span id="totalPrice">0</span></td>
						</tr>
					</tfoot>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>