<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/css/bootstrap.css">
<jsp:include page="../template/header.jsp"></jsp:include>
<style>
.outbox {
	width : 1020px;
	color : black;
}

h3 {
	color : black;
	font-family : "굴림";
}

.col-lg-12 {
	margin: 0.5rem;
}
/* best 상품 */
.slide_list {
	text-align:center;
	display: inline-block;
    max-width: 1020px;
    position: relative;
}

.best_product {
    display: inline-block;
    padding: 10px;
    margin : 1rem 1.5rem;
    cursor: pointer;
    position: relative;
    width : 210px;
} 

.item.active {
	margin: 2rem;
	display: inline;
	width: 80%;
	max-height: 340px;
}

.left {
	position: absolute;
	top : 50%;
	left:5%;
}

.right {
	position: absolute;
	left: 95%;
	top : 50%;
}

.carousel-inner > .item.next,
  .carousel-inner > .item.active.right {
    left: -1000px;
}

 .carousel-inner > .item.prev,
  .carousel-inner > .item.active.left {
    left: -1000px;
    }

.best_product a > label{
	display:inline-block;
	width: 180px;
	text-decoration:none;
	padding-top: 5px;
	font-size:15px;
}

.best_product:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}
#carousel-generic {
 width: 1000px;
}
.carousel-indicators {
	position: absolute;
	bottom: 10px;
	left: 50%;
	z-index: 15;
	width: 60%;
	padding-left: 0;
	margin-left: -30%;
	text-align: center;
	list-style: none;
}

.carousel-indicators li{
background-color: #000 \9;
  background-color: rgba(0, 0, 0, 0);
  border: 1px solid black;
}

.carousel-indicators .active {
	background-color: black;
}


/* 체크박스 검색 */
.check_header {
	display: inline-block;
	float : left;
    font-size: 17px;
	width: 10%;    
    background-color: #3296D7;
    color : white;
    text-align: center;
    padding: 15px;
    font-weight: bold;
    margin: 0 auto;
}

.checkbox-ul {
	
	width: 90%;
	padding: 5px 5px;
	float:left;
	margin: 0 auto;
}

.checkbox-ul li{
	display: inline-block;
    padding: 10px;
    font-size: 12px;
    cursor: pointer;
    width: 100px;
}


/* 상품 리스트 */
.pList {
	height: auto;
	display: inline-block;
	list-style: none;
    max-width: 1020px;
    border-bottom : 1px solid #dcdcdc;
}
.pList > li:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}

.pList a {
	margin-top: 1rem;
}
.pList a > label{
	display:inline-block;
	width: 180px;
	text-decoration:none;
	padding-top: 5px;
	font-size:15px;
}
.price {
	color: #FF4646;
	font-size: 20px;
	text-align: center;
}

.detail > img{
	display: inline-block;
	width:210px;
	height:200px;
}

.pList li {
	display: inline-block;
    padding: 10px;
    margin : 1rem 1.5rem;
    cursor: pointer;
    position: relative;
    width : 210px;
    
}

.vot_btn {
	position : absolute;
	top:160px;
	left:150px;
	background-color:white;
}

.vot_btn > img {
	width:50px;
	heigth:50px;
}



</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	$(document).ready(function(){
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
		
		var category = $("input[name='category']").val();
		// 필터링
		$("input[type='checkbox']").on("change", function(e){
			var brand = new Array();
			 
			$(".brand_check input[type='checkbox']:checked").each(function(index, item) {
				brand.push($(item).val());
			});
			
			if(brand.length == 0 || brand == "") {
				$(".brand_check input[type='checkbox']").each(function(index, item) {
					brand.push($(item).val());
				});
			}
			
			var type = new Array();
		 
			$(".typeCheck input[type='checkbox']:checked").each(function(index, item) {
				type.push($(item).val());
			});
			
			if(type.length == 0 || type == "") {
				$(".typeCheck input[type='checkbox']").each(function(index, item) {
					type.push($(item).val());
				});
			}
			
			var searchData = {
					category : category,
					type : type,
					brand : brand
			}
			
			var jsonData = JSON.stringify(searchData);
			
			$.ajax({
				url : '/product/search',
				contentType : 'application/json',
				data : jsonData,
				type : 'POST',
				traditional : true,
				success : function(result){
					console.log("성공!");
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
						$("[data-no="+product_no+"]").find("#vote_img").attr("src", "/img/product/like.png");
						$("[data-no="+product_no+"]").attr("value", "true");
					} else {
						$(target).find(".like").attr("src", "/img/product/unlike.png");
						$("[data-no="+product_no+"]").find("#vote_img").attr("src", "/img/product/unlike.png");
						$("[data-no="+product_no+"]").attr("value", "false");
					}
					
					
					}
			}); // ajax
		}); // end 좋아요
		
		// 페이징
		var pagingForm = $("#pagingForm");
		$(".paginate_button a").on("click", function(e) {
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
<div class="container">
<input type="hidden" name="category" value="${category}">
<input type="hidden" name="user_num"value="${check}">
<div class="col-lg-12">
	<c:if test="${auth eq 'seller'}">
		<input type="button" id="productWrite" class="btn btn-primary btn-sm" value="상품 등록">
	</c:if>
</div>

	<div class="slide_list">
		<h3>${cName} BEST </h3>		
		<div id="carousel-generic" class="carousel slide">
			<ol class="carousel-indicators">
				<li data-target="#carousel-generic" data-slide-to="0" class="active"></li>
				<li data-target="#carousel-generic" data-slide-to="1"></li>
			</ol>
			
			<div class="carousel-inner" role="listbox">
			<div class="item active">
				<c:forEach var="best" items="${best}" varStatus="status">
					<c:if test="${best.rn le 2}">
						<div class="best_product">
						<a class="detail" href="#">
							<img class="img-responsive" src="/viewImg?fileName=${best.image_save_name}&imageType=${best.image_type}">
							<label><c:out value="${best.brand_name}"/></label>
							<label><c:out value="${best.product_name}" /></label>
							<label class="price"><fmt:formatNumber value="${best.product_price}" pattern="###,###,###"/>원</label>
						</a>
							<button class="vot_btn" data-no="${best.product_no}" value="false">
								<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
							</button>
							</div>
					</c:if>
				</c:forEach>
			</div> <!-- item active -->
			
			<div class="item">
				<c:forEach var="best" items="${best}" varStatus="status">
					<c:if test="${best.rn gt 2}">
						<div class="best_product">
								<a class="detail" href="#">
									<img class="img-responsive" src="/viewImg?fileName=${best.image_save_name}&imageType=${best.image_type}">
									<label><c:out value="${best.brand_name}"/></label>
									<label><c:out value="${best.product_name}" /></label>
									<label class="price"><fmt:formatNumber value="${best.product_price}" pattern="###,###,###"/>원</label>
								</a>
								<button class="vot_btn" data-no="${best.product_no}" value="false">
									<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
								</button>
					</div>
					</c:if>
				</c:forEach>
			</div> <!-- item -->
			</div> <!-- carousel -->
	</div> <!-- slide_list -->
			
			
			<a class="left" href="#carousel-generic" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
			</a>
			<a class="right" href="#carousel-generic" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
			</a>

	</div>
	<script>
	$(function(){
		// 이미지 슬라이드 컨트롤를 사용하기 위해서는 carousel를 실행해야한다.
		$('#carousel-generic').carousel({
		// 슬리아딩 자동 순환 지연 시간
		// false면 자동 순환하지 않는다.
		interval: false,
		// hover를 설정하면 마우스를 가져대면 자동 순환이 멈춘다.
		pause: "hover",
		// 순환 설정, true면 1 -> 2가면 다시 1로 돌아가서 반복
		wrap: true,
		// 키보드 이벤트 설정 여부(?)
		keyboard : true
		});
		});


	</script>
	<div class="col-lg-12">
		<h3>상품 찾아보기</h3>
		<div class="ck_search">
				<span class="check_header">브랜드</span>	
				<ul class="brand_check checkbox-ul">
					<c:forEach var="brand" items="${brand}">
						<li>
							<label class="checkbox-inline">
								<input type="checkbox" value="${brand.brand_num}" id="${brand.brand_name}"><c:out value="${brand.brand_name}"/>
							</label>
						</li>
					</c:forEach>
				</ul>
				<span class="check_header">피부타입</span>
				<ul class="typeCheck checkbox-ul">
					<li>
						<label class="checkbox-inline" >
							<input type="checkbox" value="건성" id="inlineCheckbox1">건성
						</label>
					</li>
					<li>
						<label class="checkbox-inline" >
							<input type="checkbox" value="지성" id="inlineCheckbox2">지성
						</label>
					</li>
					<li>
						<label class="checkbox-inline" >
							<input type="checkbox" value="민감성" id="inlineCheckbox3">민감성
						</label>
					</li>
					<li>
						<label class="checkbox-inline" >
							<input type="checkbox" value="복합성" id="inlineCheckbox4">복합성
						</label>
					</li>
					<li>
						<input type="checkbox" value="all" style="display:none;">
					</li>
				</ul>
				</div>
	</div>
			
	<div class="col-lg-12" id="appendHtml">
	<h3>상품 리스트</h3>
			<ul class="pList">
				<c:forEach var="lists" items="${list}">
					<li class="col-sm-3">
						<input type="hidden" name="product_no" value="${lists.product_no}">
						<a class="detail" href="#">
 							<img class="img-responsive" src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}">
 							<label><c:out value="${lists.brand_name}"/></label>
							<label><c:out value="${lists.product_name}" /></label>
							<label class="price"><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
						</a>
							<button class="vot_btn" data-no="${lists.product_no}" value="false">
								<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
							</button>
					</li>
				</c:forEach>
			</ul>
	</div>
	
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${page.prev}">
				<li class="paginate_button previous">
					<a href="${page.startPage-1}">Prev</a>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
				<li class="paginate_button ${page.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			
			<c:if test="${page.next}">
				<li class="paginate_button next">
					<a href="${page.endPage+1}">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<form id='pagingForm' action="/product/categoryList" method="get">
	<input type="hidden" name="category" value="${category}">
	   	<input type="hidden" name='pageNum' value='${page.pageNum}'>
	   	<input type="hidden" name='amount' value='${page.amount}'>
   </form>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/bootstrap.js"></script>
<jsp:include page="../template/footer.jsp"></jsp:include>