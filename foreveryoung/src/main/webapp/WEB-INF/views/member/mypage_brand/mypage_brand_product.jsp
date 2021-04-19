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
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

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
		padding-top:50px; 
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
		/* border-radius: 8px; */ 
		
	}
	
	
	.search{
		display: inline-block; 
		margin:10px;
	}

</style>

<script>
$(".menu a").click(function() {
    $(".menu a.active").removeClass("active");
    $(this).addClass("active");
})


/* DatePicker */
   $(document).ready(function () {
            $.datepicker.setDefaults($.datepicker.regional['ko']); 
            $( "#startDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                      //시작일(startDate) datepicker가 닫힐때
                      //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                     $("#endDate").datepicker( "option", "minDate", selectedDate );
                 }    
 
            });
            $( "#endDate" ).datepicker({
                 changeMonth: true, 
                 changeYear: true,
                 nextText: '다음 달',
                 prevText: '이전 달', 
                 dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                 dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
                 monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
                 dateFormat: "yymmdd",
                 maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                 onClose: function( selectedDate ) {    
                     // 종료일(endDate) datepicker가 닫힐때
                     // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                     $("#startDate").datepicker( "option", "maxDate", selectedDate );
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
		<h2>판매상품 관리 페이지</h2>
	</div>
	
	
	
	<div class="search center">
		<!--Date Picker   -->
		<div class="calendarForm">
			<label class="calendarLabel">날짜입력</label>
			<input class="calendarInput" type="text" id="startDate">
			<label class="calendarLabel">부터</label> 
			<input class="calendarInput" type="text" id="endDate">
			<label class="calendarLabel">까지</label> 
		</div><br>
	
		<!-- 검색창 -->
		<div class="center searchBar">
			<input class="searchInput" type="text" placeholder="상품명을 입력해주세요">
			<button class="searchButton">검색</button>
		</div>
	</div><br>
	
	
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
					<th scope="col" class="text-center">수정 / 삭제</th>
				</tr>
			</thead>
		
			<tbody>
			
				<c:forEach var="lists" items="${list}">
				<tr>
					<td class="col-md-1">
						<c:out value="${lists.product_no}" />
					</td>
					<td>
						<img class="productImg" src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}">
					</td>
					<td class="col-md-1">
						<c:out value="${lists.product_category}" />
					</td>
					<td class="col-md-1"> 
						<c:out value="${brand_info.brand_name}" />
					 </td>
					<td class="col-md-1">
						<c:out value="${lists.product_name}" />
					</td>
					<td class="col-md-1">
						<label class="price"><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
					</td>
					<td class="col-md-1">
						<label class="stock"><fmt:formatNumber value="${lists.product_stock}" pattern="###,###,###"/>개</label>
					</td>
					<td class="col-md-1">
						<c:out value="${lists.product_regDate}" />
					</td>
					<td class="col-md-1">
						<div>
							<button>수정하기</button>
							<button>삭제하기</button>
						</div>
					<td>	
				<tr>
				</c:forEach>
			</tbody>
		</table>
</section>
	
	<%-- 
		<a class="detail" href="#">
						
								<label></label>
								
								<label><c:out value="${lists.product_category}" /></label>
								<label><c:out value="${lists.brand_name}"/></label>
							<label><c:out value="${lists.product_name}" /></label>
							<label class="price"><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
							<label class="stock"><fmt:formatNumber value="${lists.product_stock}" pattern="###,###,###"/>개</label>
							<label><c:out value="${lists.product_regDate}" /></label>
						</a>
						<button>샹품 삭제</button>
						<br>
	
	<div class="center" style="padding-top: 10px; ">
	</div> --%>
	
		
<!--  부트스트랩을 사용하기위한 js설정 입력 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/bootstrap.js"></script>
</body>
</html>