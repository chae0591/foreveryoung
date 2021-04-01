<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<jsp:include page="../template/header.jsp"></jsp:include>
<style>
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
		<div class="slide_list">
			<a href="#"><img src="https://placeimg.com/100/100/any"></a>
		</div>
		<div class="slide_list">
			<a href="#"><img src="https://placeimg.com/100/100/any"></a>
		</div>
		<div class="slide_list">
			<a href="#"><img src="https://placeimg.com/100/100/any"></a>
		</div>
		<div class="slide_list">
			<a href="#"><img src="https://placeimg.com/100/100/any"></a>
		</div>
		<div class="slide_list">
			<a href="#"><img src="https://placeimg.com/100/100/any"></a>
		</div>
		<div class="slide_list">
			<a href="#"><img src="https://placeimg.com/100/100/any"></a>
		</div>
		<button>next</button>
	</div>
	
	<div class="row">
		<h2>브랜드별 검색</h2>
	</div>	
	
		<div class="row">
		<h2>내 피부에 맞는 상품 검색</h2>
	</div>
	
	<div class="row">
		<c:forEach var="lists" items="${list}">
			<div class="p_list" >
				<a href="#">
					<img src="https://placeimg.com/100/100/any">
					<label><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
					<label><c:out value="${lists.product_name}" /></label>
				</a>
			</div>
		</c:forEach>
	</div>
	
</div>

<jsp:include page="../template/footer.jsp"></jsp:include>