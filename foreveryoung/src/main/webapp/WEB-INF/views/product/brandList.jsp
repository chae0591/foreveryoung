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

.pList {
	width: 150px;
	height: auto;
	display: inline-block;
}
.pList:hover{
	text-decotation:none;
	background-color: gray;
}
.pList a {
	padding: 1rem;
	
}
.pList a label{
	display:inline-block;
	width: 150px;
	text-decoration:none;
	color: black;
}

.pList img{
	display: block;
}

.pList ul {
	list-style:none;
}

.pList > li {
	padding-bottom: 3px;
	font-size:20px;
	display:inline-block;
	float:left;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
		//var productList = $("#appendHtml").clone();
		
		var user_num = $("input[name='user_num']").val();
		if(user_num != "") {
			voteCheck();
		}
		
		function voteCheck() {
			if(user_num == "") {
				return false;
			} else {
			$.ajax({
				url : '/vote/selectVote',
				type: 'GET',
				data: {'user_num' : user_num},
				success : function(result) {
					var num = 0;
					for(var i in result) {
						var i = result[i];
						$("[data-no="+i+"]").find("#vote_img").attr("src", "/img/product/like.png");
						$("[data-no="+i+"]").attr("value", "true");
					}
				}
			});// ajax
			}
		} //end votecheck
		
		var brand = $("input[name='brand']").val();
		// 필터링
		$("input[type='checkbox']").on("change", function(e){
			var type = new Array();
		 
			$(".typeCheck input[type='checkbox']:checked").each(function(index, item) {
				type.push($(item).val());
			});
			
			if(type.length == 0 || type == "") {
				$(".typeCheck input[type='checkbox']").each(function(index, item) {
					type.push($(item).val());
				});
			}
			$.ajaxSettings.traditional = true;
			
			$.ajax({
				url : '/product/searchBrandList',
				data : {'brand': brand, 'type' : type},
				type : 'POST',
				success : function(result){
					voteCheck();
					$(".pList").html(result);
				}
			}); // ajax
		}); // end 필터링
		
		
		// 좋아요
		$(document).on('click', '.vot_btn', function(){
			var target = $(this);
			var user_num = $("input[name='user_num']").val();
			var product_no = $(this).data("no");
			if(user_num == null || user_num == "") {
				location.href="/member/login";
			}
			
			var url;
			if($(this).attr("value") == "true") {
				url = "/vote/deleteVote";
			} else if ($(this).attr("value") == "false") {
				url = "/vote/insertVote";
			}
			
			$.ajax({
				url : url,
				data : {'user_num':user_num, 'product_no':product_no},
				type: 'POST',
				success : function(result) {
					
					$(target).attr("value", result);
					if(result == "true") {
						$(target).find(".like").attr("src", "/img/product/like.png");	
					} else {
						$(target).find(".like").attr("src", "/img/product/unlike.png");
					}
				}
			}); // ajax
		}); // end 좋아요
		
		// 페이징
		var pagingForm = $("#pagingForm");
		$(".paging_num a").on("click", function(e) {
			e.preventDefault();
			pagingForm.find("input[name='pageNum']").val($(this).attr("href"));
			pagingForm.submit();
		});
		
		// 상품 등록 페이지 이동
		$("#productWrite").on("click", function(e) {
			location.href = "/product/productWrite" ;
		});
		
	});
</script>
<div class="outbox">
<input type="hidden" name="brand" value="${brand}">
<input type="hidden" name="user_num"value="${check}">
<div class="row">
	<c:if test="${auth eq 'seller'}">
		<input type="button" id="productWrite" value="상품 등록">
	</c:if>
</div>

	<div class="row">
		<h2> BEST </h2>
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
		<h2>내 피부에 맞는 상품 검색</h2>
		<div class="typeCheck">
			<label for="ckType1">건성</label><input type="checkbox" value="건성" id="ckType1">
			<label for="ckType2">지성</label><input type="checkbox" value="지성" id="ckType2">
			<label for="ckType3">민감성</label><input type="checkbox" value="민감성" id="ckType3">
			<label for="ckType4">복합성</label><input type="checkbox" value="복합성" id="ckType4">
			<input type="checkbox" value="all" style="display:none;">
		</div>
	</div>
	<div class="row" id="appendHtml">
			<ul class="pList">
				<c:forEach var="lists" items="${list}">
					<li>
						<input type="hidden" name="product_no" value="${lists.product_no}">
						<a class="detail" href="#">
 							<img src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}" style="width:150px; height:150px">
							<label><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
							<label><c:out value="${lists.product_name}" /></label>
						</a>
							<button class="vot_btn" data-no="${lists.product_no}" value="false">
								<img src="/img/product/unlike.png" id="vote_img" style="width:30px; heigth:30px;" alt="좋아요" class="like">
							</button>
					</li>
				</c:forEach>
			</ul>
	</div>
	
	<div class="row">
		<ul class="pagination">
			<c:if test="${page.prev}">
				<li>
					<a href="${page.startPage-1}">Prev</a>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
				<li class="paging_num ${page.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			
			<c:if test="${page.next}">
				<li>
					<a href="${page.endPage+1}">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<form id='pagingForm' action="/product/brandList" method="get">
		<input type="hidden" name="brand" value="${brand}">
	   	<input type="hidden" name='pageNum' value='${page.pageNum}'>
	   	<input type="hidden" name='amount' value='${page.amount}'>
   </form>
</div>

<jsp:include page="../template/footer.jsp"></jsp:include>