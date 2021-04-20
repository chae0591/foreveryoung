<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

<style></style>
<script type="text/javascript">
$(function(){
	
	//이전 버튼 이벤트
	function fn_prev(page, range, rangeSize, keyword) {
	var page = ((range - 2) * rangeSize) + 1;
	var range = range - 1;

	var url = "${pageContext.request.contextPath}/sevice_center/notice_search";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&keyword=" + keyword;
	location.href = encodeURI( url);
	}

	//페이지 번호 클릭
	function fn_pagination(page, range, rangeSize, keyword) {
	var url = "${pageContext.request.contextPath}/sevice_center/notice_search";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&keyword=" + keyword;
	location.href = encodeURI( url);
	}

	//다음 버튼 이벤트
	function fn_next(page, range, rangeSize, keyword) {
	var page = parseInt((range * rangeSize)) + 1;
	var range = parseInt(range) + 1;

	var url = "${pageContext.request.contextPath}/sevice_center/notice_search";
	url = url + "?page=" + page;
	url = url + "&range=" + range;
	url = url + "&keyword=" + keyword;
	location.href = encodeURI( url);
	}

});

</script>
</head>

<body>
<jsp:include page="../template/header.jsp"></jsp:include>
<div class="banner">
		<div class="banner-title">
			<h2>고객센터</h2>
			<p>무엇을 도와드릴까요?</p>
		</div>
	</div>
		
	<div class="service-btns">
		<button class="notice-btn">공지사항</button>
		<button class="inquiry-btn">1:1 문의</button>
	</div>
	
	<div class="serviceSrh-box">
		<label>공지사항 검색</label>
		<form class="form-inline" action="#" method="post">
			<div class="srh-box">
				<input class="keyword" type="text" placeholder="질문을 검색하세요.">
				<input class="searchBtn" type="submit" value="검색">
			</div>
		</form>
	</div>
	
	<div class="notice-list">
		<c:forEach items="${noticeList}" var="noticeList">
		<input type="hidden" name="notice_no" value="${noticeList.notice_no}">
		 		<div class="open">
		 			<ul>
		 				<li>
		 					<p>${noticeList.notice_type}</p> <p>${noticeList.notice_title}</p>
		 				</li>
		 			</ul>
		 		</div>
		 	
		 		<div class="hide" >
		 			<ul>
		 				<li>
		 					<p>${noticeList.notice_content}<p>
		 				</li>
		 			</ul>
		 		</div>
		</c:forEach>
	</div>
<!-- pagination{s} -->
	<div id="paginationBox">
		<ul class="pagination">
			<c:if test="${pagination.prev}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_prev('${pagination.page}', '${pagination.range}', '${pagination.rangeSize}')">Previous</a></li>
			</c:if>

			<c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" var="idx" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}', '${search.keyword}')">
				<li class="page-item <c:out value="${pagination.page == idx ? 'active' : ''}"/> "><a class="page-link" href="#" onClick="fn_pagination('${idx}', '${pagination.range}', '${pagination.rangeSize}')"> ${idx} </a></li>
			</c:forEach>

			<c:if test="${pagination.next}">
				<li class="page-item"><a class="page-link" href="#" onClick="fn_next('${pagination.range}', 
		'${pagination.range}', '${pagination.rangeSize}')" >Next</a></li>
			</c:if>
		</ul>
	</div>
	<!-- pagination{e} -->
	
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>