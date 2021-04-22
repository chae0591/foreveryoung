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
	$(".cancel-btn").click(function(){
		if(confirm("정말로 삭제하시겠습니까?")){
			user_num = $(this).prev().prev().val();
			product_no = $(this).prev().val();
			del_row = $(this).parent().parent();
			$.ajax({
				url : "/vote/deleteVote",
				data : {
					'user_num': user_num, 
					'product_no': product_no
					},
				type: 'POST',
				success : function(result) {
					del_row.remove();					
				}
			});
		}
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
			<div class="col-md-10 col-lg-6">
				<div class="contentbox">	
					<h2>관심 등록</h2>
					<table class="table">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when test="${empty my_vote_list}">
								<tr>
									<th colspan="4">관심 등록한 상품이 없습니다.</th>
								</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="item" items="${my_vote_list}">
										<tr>
											<td><!-- <img class="pro-img img img-responsive" src="/viewImg?fileName=${item.image_save_name}&imageType=${item.image_type}"> --></td>
											<td>
												<span>
													브랜드 : <c:out value="${item.brand_name}"></c:out> 
													상품 : <c:out value="${item.product_name}"></c:out><br>
													재고 : <c:out value="${item.product_stock}"></c:out>
													가격 :<fmt:formatNumber value="${item.product_price}" pattern="###,###,###"/>
												</span>
											</td>
											<td>
												카테고리 : <c:out value="${item.product_category}"></c:out><br>
												스킨 타입 : <c:out value="${item.product_skintype}"></c:out>
											</td>
											<td>
												<input name="user_num_check" type="hidden" value="${item.user_num}">
												<input name="product_no_check" type="hidden" value="${item.product_no}">
												<button class="btn cancel-btn">좋아요 취소</button>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>
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