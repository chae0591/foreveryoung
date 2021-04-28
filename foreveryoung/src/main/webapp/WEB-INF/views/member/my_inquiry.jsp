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
			url : '/member/my_inquiry_search_by_day',
			data : {dayval : dayvalue},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".inquiry-table").html(result);
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
			url : '/member/my_inquiry_search_by_date',
			data : {
				start_date : $("input[name=date1]").val(), 
				end_date : $("input[name=date2]").val()
				},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".inquiry-table").html(result);
			}
		});
	});
	
	$("#search-btn").click(function(){
		$.ajax({
			url : '/member/inquiry_search_by_target',
			data : {
				target : $("input[name=target]").val()
				},
			type : 'POST',
			success : function(result){
				console.log("검색");
				
				$(".inquiry-table").html(result);
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
			<div class="col-md-8">
				<div class="contentbox">
					<h2>1 : 1 상담 기록</h2>
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
						
						<table class="table inquiry-table">
							<thead>
								<tr>
									<th>날짜</th>
									<th style="width: 70%">제목</th>
									<th>상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${empty inquiry_info}">
										<tr>
											<th colspan="3">문의 사항이 없습니다.</th>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="inq" items="${inquiry_info}">
											<tr>
												<td><c:out value="${inq.inquiry_regDate}"></c:out></td>
												<td><a href="/service_center/inquiryDetail?inquiry_no=${inq.inquiry_no}"><c:out value="${inq.inquiry_title}"></c:out></a></td>
												<td>
													<c:choose>
														<c:when test="${inq.reply_no eq 0}">
															처리중 
														</c:when>
														<c:otherwise>
															답변 완료
														</c:otherwise>
													</c:choose>
												</td>
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