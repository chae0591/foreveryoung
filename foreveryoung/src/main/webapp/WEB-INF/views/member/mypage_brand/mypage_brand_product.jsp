<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Common Design Link -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/css/bootstrap.css">
<title>판매상품 관리 페이지</title>
<style>
	nav, section {
		padding:10px;
	}
	section {
		width:1450px;
		float:right; 
	}
	.menu a:hover {
	    background:#e9d319;
	    color: #000;
	}
	.menu a.active {
	    background:#e9d319;
	    color: #000;
	}
	.title{
		padding-top:30px; 
		padding-left:50px;
	}

	
	/* 사이드 바 디자인  */
	
	/* 사이드바 래퍼 스타일 */
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #000;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
  
  .active {
  	background-color: #666;
  }
  /* 서치바  */
  #searchinput { 
  	width: 200px; 
  } 
  #searchclear { 
	position: absolute;
	right: 5px;
	top: 0;
	bottom: 0;
	height: 14px;
	margin: auto;
	font-size: 14px; 
	cursor: pointer; 
	color: #ccc; 
 }
 
 .searchBar{
 	display: flex;
  	justify-content: center;
 }
 
  /* 상품 등록 버튼  */
	 .button{
	 	display:inline-block;
	 	transition-duration:0.4s;
	 	cursor:pointer;
	 }
	 
	.button1{
		border: 2px solid black;
		background: rgba(255, 255, 255, 0.2);
	}
	 
	.button1:hover{
		background-color: #C0C0C0;
	}
	/* 상품 등록 버튼 - 끝  */

</style>

<script>
	$(document).ready(function(){
		
		$(".delete_btn").click(function(){
			if(confirm("정말로 삭제하시겠습니까?")) {
				var product_no = $(this).prev().text(); 
				var del_row = $(this).parent().parent(); 
				
				$.ajax({
					url : "../product_item_del",
					type : "get",
					data : {
						product_no : product_no 
					},
					success : function(resp) {
						del_row.remove();
					}
				});
			}
		});
		
		$("#searchclear").click(function(){ $("#searchinput").val(''); });	
		
		/* $(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
			var url = "${pageContext.request.contextPath}/member/mypage_brand/mypage_brand_product";
			url = url + "&keyword=" + $('#keyword').val();
			location.href = url;
			console.log(url);
		});	 */
	});
	
	

</script>
</head>
<body>

 <div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">포에버영 판매자 페이지</a>
      </li>
      <li><a href="mypage_brand_main"> 판매자 메인</a></li>
      <li><a href="mypage_brand_buyer">구매자 관리</a></li>
      <li class="active"><a href="mypage_brand_product">판매상품 관리</a></li>
      <li><a href="mypage_brand_order">주문 관리</a></li>
      <li><a href="mypage_brand_chart">통계</a> </li>
    </ul>
  </div>
  <!-- /사이드바 -->

  <!-- 본문 -->
  <div id="page-content-wrapper">
    <div class="container-fluid">
    		<!-- 상품 등록 버튼  -->
		<div  style="float:right">
			 <a href="${pageContext.request.contextPath}/product/productWrite">
		 		<button type="button" class="btn btn-secondary button button1" style="color:black">상품 등록 하러가기</button>
			 </a>
		</div>
    	
    	
 		<!--본문 내용-->
        <div style="text-align:center;">
			<h2> <c:out value="${brand_info.brand_name}" />님의 판매상품 관리 페이지</h2>
		</div>
		<br>
		
		<!-- 서치바 -->
		<form name="form" method="get" action="../mypage_brand/mypage_brand_product">
			<select name="search_option" style="float:left;">
		        <option value="product_name"
				<c:if test="${map.search_option == 'product_name'}">selected</c:if>
				   >상품 이름</option>
		   </select>
			<div class="btn-group" style="float:left;">
				<div class="searchBar">
					<input id="searchinput" type="search" class="form-control" placeholder="상품 이름을 입력하시오" name="keyword" value="${map.keyword}">
					<span id="searchclear" class="glyphicon glyphicon-remove-circle"></span>
				</div>
		 	</div>
	 		<div style="float:left; width: 33%;">
					<button type="submit" class="btn btn-sm btn-secondary" style="color:black">검색</button>
			</div>
		</form>
		<br>
		
			<table class="table" >
				<thead>
					<tr>
						<th scope="col" class="text-center">상품 번호</th>
						<th scope="col" class="text-center">이미지</th>
						<th scope="col" class="text-center">상품 카테고리</th>
						<th scope="col" class="text-center">상품 등록자</th>
						<th scope="col" class="text-center">상품 이름</th>
						<th scope="col" class="text-center">상품 가격</th>
						<th scope="col" class="text-center">상품 재고</th>
						<th scope="col" class="text-center">상품 등록 날짜</th>
						<th scope="col" class="text-center">상품 삭제</th>
					</tr>
				</thead>
			
				<tbody>
				<c:forEach var="lists" items="${productList}">
					<tr>
						<td class="col-md-1">
							<c:out value="${lists.product_no}" />
						</td>
						<td class="col-md-1">
							<img class="productImg" src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}">
						</td>
						<td class="col-md-1">
							<c:out value="${lists.product_category}" />
						</td>
						<td>
							<c:out value="${brand_info.brand_name}" />
						</td>
						<td class="col-md-1">
							<c:out value="${lists.product_name}" />
						</td>
						<td class="col-md-1">
							<label class="price"><fmt:formatNumber value="${lists.product_price}"/>원</label>
						</td>
						<td class="col-md-1">
							<label class="stock"><fmt:formatNumber value="${lists.product_stock}"/>개</label>
						</td>
						<td class="col-md-1">
							<c:out value="${lists.product_regDate}" />
						</td>
						<td class="col-md-1">
							<span style="display: none;" >${lists.product_no}</span>
							<input type="button" class="delete_btn" value="삭제하기">
						</td>
					<tr>
					</c:forEach>
				</tbody>
			</table>
			
		<form>
		
		</form>
		<ul class="paging center"  style="color:black;">
		    <c:if test="${paging.prev}">
		        <span><a href='<c:url value="/member/mypage_brand/mypage_brand_product?page=${paging.startPage-1}"/>'>이전</a></span>
		    </c:if>
		    <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="num">
		        <span><a href='<c:url value="/member/mypage_brand/mypage_brand_product?page=${num}"/>'>${num}</a></span>
		    </c:forEach>
		    <c:if test="${paging.next && paging.endPage>0}">
		        <span><a href='<c:url value="/member/mypage_brand/mypage_brand_product?page=${paging.endPage+1}"/>'>다음</a></span>
		    </c:if>
		</ul>
    </div>
  </div>
  <!-- /본문 -->
</div>
 
<!--  부트스트랩을 사용하기위한 js설정 입력 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/bootstrap.js"></script>
</body>
</html>