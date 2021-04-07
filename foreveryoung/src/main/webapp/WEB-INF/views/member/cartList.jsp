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
								
				<!--$.ajax({
					url : "cart_item_del",
					type : "get",
					data : {
						cart_no : 
					},
					success : function(resp) {
						
					}
				});-->
			}
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
				<input type="button" class="input input-inline del-cart-btn" value="전체 삭제">
				<table>
					<tbody>
						<c:forEach var="cartItem" items="${userCartList}">
							<tr>
								<td><span class="hidden-cart-no">${cartItem.cart_no}</span><input type="checkbox" class="cartitemcheck"></td>
								<td>상품 정보 : ${cartItem} </td>
								<td><span class="hidden-cart-no">${cartItem.cart_no}</span><input type="button" class="del-cart-item" value="X"></td>
							</tr>
						</c:forEach>
					</tbody>
					<tfoot>
						<tr>
							<td>
								체크된 항목 계산 (얼마인지)
								
								구매 버튼 -> 구매화면으로 이동
							</td>
						</tr>
					</tfoot>
				</table>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>