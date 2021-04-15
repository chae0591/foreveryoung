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
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="${pageContext.request.contextPath}/css/member/js/bootstrap.js"></script>
<script>
$(document).ready(function(){
	$("#totalcheck").change(function(){
		var checkval = $(this).prop("checked");
		$(".checkitem").prop("checked", checkval);
	});
	
	$(".del-ad-item").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")) {
			var address_no = $(this).prev().text();
			var del_row = $(this).parent().parent();
			
			$.ajax({
				url : "address_item_del",
				type : "get",
				data : {
					address_no : address_no
				},
				success : function(resp) {
					del_row.remove();
				}
			});
		}
	});
	
	$(".del-total-btn").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")) {
			var address_no_array = [];
			
			$('input[class="checkitem"]:checked').each(function(){
				address_no_array.push($(this).val());
			});
			
			if(address_no_array.length == 0) {
				alert("삭제할 상품을 1개 이상 선택해주세요");
				return;
			}
			
			$.ajax({
				url : "address_item_del",
				type : "post",
				traditional : true,
				data : {
					addressArr : address_no_array
				},
				success : function(resp) {
					$('input[class="checkitem"]:checked').each(function(){
						$(this).parent().parent().remove();
					});
				}
			});
		}
	});
	
	$(".sel-ad-item").click(function(){
		if(confirm("기본 배송지로 설정하시겠습니까?")){
			var address_no = $(this).prev().prev().text();
			var sel_row = $(this).parent().parent();
			
			$.ajax({
				url : "address_item_sel",
				type : "get",
				data : {
					address_no : address_no
				},
				success : function(resp) {
					<!--여기에 셀렉트 된 (기본 배송지가 된 줄은 다르게 표시되도록) -->
				}
			});
		}
	});
	
})
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
			<div class="outbox" style="width: 700px">
				<h2>배송지 목록</h2>
				<c:choose>
					<c:when test="${empty adList}">
						<h5>배송지를 등록해 주세요!</h5>
					</c:when>
					<c:otherwise>
						<input type="checkbox" id="totalcheck"><label for="totalcheck">전체 선택</label>
						<input type="button" class="input input-inline del-total-btn" value="선택 삭제">
						<table class="table table-bordered">
							<tr>
								<th></th>
								<th>배송지명</th>
								<th>배송지 주소</th>
								<th></th>
							</tr>
							<c:forEach var="ad" items="${adList}">
							<tr>
								<td rowspan="2"><input type="checkbox" class="checkitem" value="${ad.address_no}"></td>
								<td rowspan="2">${ad.address_name}</td>
								<td>${ad.address_jibun}, ${ad.address_detail}</td>
								<td rowspan="2">
									<span class="hidden-cart-no" style="display: none;">${ad.address_no}</span>
									<input type="button" class="del-ad-item" value="삭제">
									<input type="button" class="sel-ad-item" value="대표주소">
								</td>
							</tr>
							<tr>
								<td>${ad.address_roadname}, ${ad.address_detail}</td>
							</tr>
							</c:forEach>
						</table>
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