<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<style>
.outbox {
	
}
.slide_list {
	display: inline-block;
}

.p_list {
	width: 110px;
	height: 150px;
	display: inline-block;
}
.p_list:hover{
	text-decotation:none;
	background-color: gray;
}
.p_list a {
	padding: 1rem;
}
.p_list a label{
	text-decoration:none;
	color: black;
}

.p_list img{
	display: block;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		
	});
</script>
<div class="outbox">
	<div class="row">
		<h2>${category} BEST</h2>
		<button>prev</button>
		<div class="slide_list">
			<a href="#">
				<img src="https://placeimg.com/100/100/any">
			</a>
		</div>
		<div class="slide_list">
			<a href="#"><img src="https://placeimg.com/100/100/any"></a>
		</div>
		<button>next</button>
	</div>
	
	<div class="row">
		<h2>브랜드별 검색</h2>
		<%-- <c:forEach var="brand" items="${brand}">
			<input type="checkbox" value="${brand.brand_name}">
			<input type="hidden" value="${brand.brand_no}">
		</c:forEach> --%>
	</div>	
	
	<div class="row">
		<h2>내 피부에 맞는 상품 검색</h2>
		<div class="typeCheck">
			<label for="ck_type1">건성</label><input type="checkbox" value="건성" id="ck_type1">
			<label for="ck_type2">지성</label><input type="checkbox" value="지성" id="ck_type2">
			<label for="ck_type3">민감성</label><input type="checkbox" value="민감성" id="ck_type3">
			<label for="ck_type4">복합성</label><input type="checkbox" value="복합성" id="ck_type4">
		</div>
	</div>
	
	<div class="row">
			<div class="p_list" >
			<c:forEach var="lists" items="${list}">
				<a href="#">
					<img src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}" style="width:150px; height:150px">
					<label><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
					<label><c:out value="${lists.product_name}" /></label>
					<!-- 좋아요 여부-->
					
				</a>
				</c:forEach>
			</div>
	</div>
	
</div>

<jsp:include page="../template/footer.jsp"></jsp:include>