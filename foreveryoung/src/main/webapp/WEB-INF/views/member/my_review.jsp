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
	search_day = function(dayvalue){
		$.ajax({
			url : '/member/my_review_search_by_day',
			data : {dayval : dayvalue},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".reviw-table").html(result);
			}
		});
	}
	
	$("#1day-btn").click(function(){
		search_day(1);
	});
	$("#7day-btn").click(function(){
		search_day(7);
	});
	$("#15day-btn").click(function(){
		search_day(15);
	});
	$("#30day-btn").click(function(){
		search_day(30);
	});
	
	$("#date-search-btn").click(function(){
		$.ajax({
			url : '/member/my_review_search_by_date',
			data : {
				start_date : $("input[name=date1]").val(), 
				end_date : $("input[name=date2]").val()
				},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".review-table").html(result);
			}
		});
	});
	
	$("#search-btn").click(function(){
		$.ajax({
			url : '/member/review_search_by_target',
			data : {
				target : $("input[name=target]").val()
				},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".review-table").html(result);
			}
		});
	})
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
					<h2>리뷰 목록</h2>
					<div class="outbox">
					<div>
							<div>
								<button id="1day-btn">1일</button>
								<button id="7day-btn">1주일</button>
								<button id="15day-btn">15일</button>
								<button id="30day-btn">1개월</button>
							</div>
							
							<div>
								<input type="date" name="date1"> ~ <input type="date" name="date2">
							</div>
							<div><button id="date-search-btn">조회하기</button></div>
						</div>
						
						<table class="table review-table">
							<thead>
								<tr>
									<th>날짜</th>
									<th style="width: 30%">제목</th>
									<th></th>
									<th style="width: 30%">상품</th>
									<th>별점</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty review_info}">
										<tr>
											<th colspan="5">남기신 리뷰가 없습니다.</th>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="review" items="${review_info}">
										<tr>
											<td><span><fmt:formatDate value="${review.review_date}" pattern="yyyy-MM-dd"/></span></td>
											<td style="width: 40%">${review.review_title}</td>
											<td><!-- <img class="pro-img img img-responsive" src="/viewImg?fileName=${review.image_save_name}&imageType=${review.image_type}"> --></td>
											<td style="width: 40%">
												브랜드 : ${review.brand_name} <br> 
												<a href="/detail_board/detail_main?product_no=${review.product_no}">상품 : ${review.product_name}</a>
											</td>
											<td>${review.review_score} / 5</td>
										</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>	
						<div class="row">
							<div class="col-lg-offset-6 col-lg-6">
								<input type="text" name="target"> <button id="search-btn">검색</button>
							</div>
						</div>	
					</div>
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