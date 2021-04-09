<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<style>
.slide_list {
	display: inline-block;
}

.p_list {
	width: 150px;
	height: auto;
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
		var productList = $(".p_list").clone();
		
		$("input[type='checkbox']").on("change", function(e){
			var type = new Array();
			$("input[type='checkbox']:checked").each(function(index, item) {
				type.push($(item).val());
			});
			var category = $("input[name='category']").val();
			
			$.ajaxSettings.traditional = true;
			if(type.length == 0) {
					$(".p_list").html(productList);
			} else {
				$.ajax({
					url : '/product/search',
					data : {'category':category, 'type': type},
					type : 'POST',
					success : function(result){
						console.log(result);
						
						var html = $(".p_list").html(result);
						var content = html.find("div#p_list_ajax").html();
						$(".appendHtml").html(content);
					}
				});
			}
		}); 
		
		
		
	});
</script>
<div class="outbox">
<input type="hidden" name="category" value="${category}">
	<div class="row">
		<h2>BEST</h2>
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
		<h2>상품 종류별 검색</h2>
		<div class="typeCheck">
			<label for="ck_cat1">스킨케어</label><input type="checkbox" value="skincare" id="ck_cat1">
			<label for="ck_cat2">메이크업</label><input type="checkbox" value="makeup" id="ck_cat2">
			<label for="ck_cat3">바디케어</label><input type="checkbox" value="bodycare" id="ck_cat3">
			<label for="ck_cat4">헤어케어</label><input type="checkbox" value="haircare" id="ck_cat4">
			<label for="ck_cat5">향수/디퓨저</label><input type="checkbox" value="perfurm" id="ck_cat5">
			<label for="ck_cat6">남성케어</label><input type="checkbox" value="manscare" id="ck_cat6">
		</div>
	</div>
	<div class="row" id="appendHtml">
			<div class="p_list" >
				<c:forEach var="lists" items="${list}">
					<a href="#">
						<img src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}" style="width:150px; height:150px">
						<label><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
						<br>
						<label><c:out value="${lists.product_name}" /></label>
						<label for="vote">좋아요</label><input type="checkbox" value="">
					</a>
				</c:forEach>
			</div>
	</div>
</div>

<jsp:include page="../template/footer.jsp"></jsp:include>