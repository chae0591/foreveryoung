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

<style>
.banner {
	text-align: center;
	min-width: 1020px;
	height: 100px;
	background-color: #dddddd;
}
.banner-title {
	width: 1020px;
	height: 100%;
	margin: 0 auto;
}
.banner-title  h2, p{
	float: left;
	position: inline-box;
	padding-top: 20px;
	margin-right: 10px;
}
.service-btns {
    padding: 0;
    width: 1020px;
    height:55px;
	text-align: center;
	margin:0 auto;
	margin-bottom:20px;
	margin-top: 20px;
}
.service-btns button{
    width: 50%;
	height:100%;
	text-align: center;
	float: left;
	position: relative;
	font-size: 20px;
	font-weight: 500;
	border-radius: 5px;
}
.notice-btn {
	background-color: #555;
	color: #fff;
}
.service-btns button:hover {
	background-color: #555;
	color: #fff;
}
.serviceSrh-box  {
	width: 1020px;
	height: 100px;
	margin: 0 auto;
	padding: 0;
	margin-top: 20px;
	background-color: #dddddd;
	position: relative;
}
.serviceSrh-box > label {
	color: #666;
    font-size: 20px;
    font-weight: 400px;
    float: left;
    position: absolute;
    top: 40%;
    left: 25%;
}
.srh-box {
	width: 350px;
	height: 40px;
	text-align: center;
	float: left;
	margin: 0;
	padding: 0;
	position: relative;
	border: 2px solid #e5e5e5;
	background-color: #fff;
    border-radius: 20px;
     position: absolute;
    top: 30%;
    left: 40%;
}
.serviceSrh-box > input {
	display: inline-block;
	float: left;
}
.srh-box > .keyword {
    float: left;
    position: relative;
	width: 80%;
    height: 100%;
    font-size: 14px;
    line-height: 22px;
    color: #888;
    border: 0px;
	margin-left: 20px;
	background-color: #fff;
}
.srh-box > .searchBtn {
    background: url( "/resources/img/search.png" ) no-repeat;
	 background-size: 20px 20px;
	 background-position: center;
     border: none;
     cursor: pointer;
     font-size: 0px;
     width: 10%;
     height: 100%;
     float: right;
     margin-right: 10px;
} 
.category-btns {
	width: 1020px;
	height: 118px;
	margin: 0 auto;
	margin-top: 20px;
}
.category-btns button {
	width: 145.7px;
    height: 100%;
    color: #666;
    background: #fff;
    box-sizing: border-box;
    font-size: 14px;
    padding-top: 60px;
    font-weight: 400;
 	border: 1px solid #e5e5e5;
 	float: left;
}
.category-btns > .notice1 {
	 background: url( "/resources/img/notice1.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice2 {
	 background: url( "/resources/img/notice2.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice3 {
	 background: url( "/resources/img/notice3.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice4 {
	 background: url( "/resources/img/notice4.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice5 {
	 background: url( "/resources/img/notice5.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice6 {
	 background: url( "/resources/img/notice6.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.category-btns > .notice7 {
	 background: url( "/resources/img/notice7.png" ) no-repeat;
	 background-size: 65px 65px;
	 background-position: 50% 40%;
	 width: 145.7px;
     height: 100%;
}
.notice-list {
	width: 1020px;
	height: auto;
	margin: 0 auto;
	display: block;
	margin-top: 20px;
	margin-bottom: 40px;
	border-top: 2px solid #666;
	border-bottom: 2px solid #666;
	position: relative;
}
.notice-list ul li {
	width: 100%;
}
.notice-list p {
	padding: 10px;
}
.notice-list > .open {
	width: 100%;
	height: 60px;
	border-bottom: 1px solid #e5e5e5;
	background: url( "/resources/img/list.png" ) no-repeat;
	background-size: 1020px 60px;
	background-position: 0% 0%;
	padding-left: 60px;
	padding-top: 10px;
}
.notice-list > .open > li {
	width: 100%;
	height: 100%;
	display: block;
}
.notice-list > .hide {
	width: 100%;
	min-height: 60px;
	background-color: #e6e6e6;
	padding-left: 60px;
}
.notice-list > .hide > li {
	width: 100%;
	height: 100%;
}
.last-box {
	width: 1020px;
	margin: 0 auto;
	text-align: center;
	height: auto;
	margin-bottom: 40px;
}
.inquiryGobtn {
	width: 150px;
	height: 50px;
	color: #fff;
    font-weight: 700;
    border-radius: 5px;
    font-size: 18px;
    line-height: 30px;
    background-color: #555;
}
</style>

<script>
$(function(){
	//처음에 내용 숨기기
	$(".hide").hide();
	
	//게시글 클릭시 내용 나오도록
	$(".open").click(function(){
        if($(this).next().css('display') == 'none'){
        	$(this).next().show();
   		 }else{
       		$(".hide").hide();
    	}
	});
	
	//공지사항으로 이동
	$(".notice-btn").click(function(){
   			location.href = '/service_center/notice';
	});
	
	//1:1문의로 이동
	$(".inquiry-btn").click(function(){
		var id = "${check}";
		
        if(id == ''){
        	 alert("로그인 후 문의 가능합니다.");
        	 location.href = '/member/login';
   		 }else{
   			 location.href = '/service_center/inquiry';
    	}
	});
	
	//1:1버튼 클릭시
	$(".inquiryGobtn").click(function(){
		var id = "${check}";
		
        if(id == ''){
        	 alert("로그인 후 문의 가능합니다.");
        	 location.href = '/member/login';
   		 }else{
   			 location.href = '/service_center/inquiryRegister';
    	}
	});
	
	$(".searchBtn").click(function(){
		self.location = "list" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	});
	
	//원하는 페이지로 이동시 검색조건, 키워드 값을 유지하기 위해
	function list(page){
		location.href="${path}/service_center/notice?curPage="+page+"&keyword=${map.keyword}";
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
				<input class="keyword" id="keyword" type="text" placeholder="질문을 검색하세요.">
				<input class="searchBtn"  id="searchBtn"type="submit" value="${scri.keyword}">
			</div>
		</form>
	</div>
	
	<div class="category-btns">
			<button class="notice1">회원</button>
			<button class="notice2">주문/결제</button>
			<button class="notice3">배송</button>
			<button class="notice4">교환/환불/반품</button>
			<button class="notice5">이벤트/쿠폰</button>
			<button class="notice6">판매자</button>
			<button class="notice7">기타</button>
	</div>
	
	<div class="notice-list">
		<c:forEach items="${map.noticeList}" var="noticeList">
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
	
	<!-- 페이징 -->
		<tr>
			<td colspan="5">
				<!-- 처음페이지로 이동 : 현재 페이지가 1보다 크면  [처음]하이퍼링크를 화면에 출력-->
				<c:if test="${map.noticePager.curBlock > 1}">
					<a href="javascript:list('1')">[처음]</a>
				</c:if>
				
				<!-- 이전페이지 블록으로 이동 : 현재 페이지 블럭이 1보다 크면 [이전]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.noticePager.curBlock > 1}">
					<a href="javascript:list('${map.noticePager.prevPage}')">[이전]</a>
				</c:if>
				
				<!-- **하나의 블럭 시작페이지부터 끝페이지까지 반복문 실행 -->
				<c:forEach var="num" begin="${map.noticePager.blockBegin}" end="${map.noticePager.blockEnd}">
					<!-- 현재페이지이면 하이퍼링크 제거 -->
					<c:choose>
						<c:when test="${num == map.noticePager.curPage}">
							<span style="color: red">${num}</span>&nbsp;
						</c:when>
						<c:otherwise>
							<a href="javascript:list('${num}')">${num}</a>&nbsp;
						</c:otherwise>
					</c:choose>
				</c:forEach>
				
				<!-- 다음페이지 블록으로 이동 : 현재 페이지 블럭이 전체 페이지 블럭보다 작거나 같으면 [다음]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.noticePager.curBlock <= map.noticePager.totBlock}">
					<a href="javascript:list('${map.noticePager.nextPage}')">[다음]</a>
				</c:if>
				
				<!-- 끝페이지로 이동 : 현재 페이지가 전체 페이지보다 작거나 같으면 [끝]하이퍼링크를 화면에 출력 -->
				<c:if test="${map.noticePager.curPage <= map.noticePager.totPage}">
					<a href="javascript:list('${map.noticePager.totPage}')">[끝]</a>
				</c:if>
			</td>
		</tr>
		<!-- 페이징 -->

	<div class="last-box">
		<button class="inquiryGobtn">1:1 문의하기</button>
	</div>
	
<jsp:include page="../template/footer.jsp"></jsp:include>

</body>
</html>