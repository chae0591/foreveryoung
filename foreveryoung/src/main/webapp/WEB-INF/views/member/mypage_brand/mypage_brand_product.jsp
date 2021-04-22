<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 사이드 매뉴 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">

<!-- Common Design Link -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">

<!--  DatePicker-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
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

	/* placeholder 색상  */
	input:-ms-input-placeholder {color: #a8a8a8; }
	input:-webkit-input-placeholder {color: #a8a8a8; }
	input:-moz-placeholder {color: #a8a8a8; }
	
	.searchBar{
		height:40px;
		width:400px;
		border: 1px solid #1b5ac2;
		background: #ffffff;
		
		margin:0 auto;
	}

	.searchInput{
		font-size: 16px;
		width:325px;
		padding:7px;
		border: 0px;
		outline: none;
		float:left; 
	}
	
	.searchButton{
		width:50px;
		height:100%;
		border: 0px;
		background: #1b5ac2;
		outline: none;
		float: right;
		color: #ffffff;
	}
	
	
	.calendarForm{
		display:flex; 
		flex-direction: row;
		
	   display: flex;
	  justify-content: center;	
	}
	
	.calendarInput{
		display: block;
	}
	
	.calendarLabel{
		display: block;
	}
	
	
	.productImg{
		width:150px;  
		height:100px;  
	}
	
	
	.search{
		display: inline-block; 
		margin:10px;
	}

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
		
	});
	
</script>
</head>
<body>
	<!-- <div id="left"> -->
		<!-- Sidebar/menu -->
		<nav class="menu w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
		  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
		  <div class="w3-container">
		    <h3 class="w3-padding-64"><b>포에버영<br>판메자 페이지</b></h3>
		  </div>
		  
		  <div class="w3-bar-block">
		    <a href="mypage_brand_main" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매자 메인</a> 
		    <a href="mypage_brand_buyer" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">구매자 관리</a> 
		    <a href="mypage_brand_product" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매 상품관리</a> 
		    <a href="mypage_brand_order" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">주문 관리</a> 
		    <a href="mypage_brand_chart" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">통계</a> 
		  </div>
		</nav>

<section>
	<div class="center title">
		<h2> <c:out value="${brand_info.brand_name}" />님의 판매상품 관리 페이지</h2>
	</div>
	
	
	
	<div class="search center title" style="margin-left: 40px;">
		<div class="calendarForm">
			<!--Date Picker   -->
			<label class="calendarLabel">날짜입력</label>
			<input class="calendarInput" type="text" id="startDate">
			<label class="calendarLabel">부터</label> 
			<input class="calendarInput" type="text" id="endDate">
			<label class="calendarLabel">까지</label> 
			
			<!-- 검색창 -->
			<div class="center searchBar" style="margin-left: 150px;">
				<input class="searchInput" type="text" placeholder="상품명을 입력해주세요">
				<button class="searchButton">검색</button>
			</div>
		</div>
	</div>
	<!-- 상품 등록 버튼  -->
	<div  style="padding_left: 225px">
		 <a href="${pageContext.request.contextPath}/product/productWrite">
	 		<button>상품 등록 하러가기</button>
		 </a>
	</div>
	<br>
	
		<table class="table table-hover m-2" >
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
			
				<c:forEach var="lists" items="${list}">
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
</section>
		
<!--  부트스트랩을 사용하기위한 js설정 입력 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/bootstrap.js"></script>
</body>
</html>