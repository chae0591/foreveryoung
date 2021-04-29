<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<style>
.inquiry-list > .check-inquiry {
	width: 100%;
	min-height:60px;
}
.inquiry-list > .check-inquiry ul {
	width: 100%;
	height: 100%;
}
.inquiry-list > .check-inquiry li {
	width: 100%;
	height: 60px;
	display: block;
	border-bottom: 1px solid #e5e5e5;
}
.inquiry-list > .check-inquiry > ul > li > .onReply {
	width: 15%;
	height: 100%;
	float: left;
	display: inline-block;
	padding-top: 20px;
	padding-left: 50px;
}
.inquiry-list > .check-inquiry > ul > li > .offReply {
	width: 15%;
	height: 100%;
	float: left;
	display: inline-block;
	padding-top: 20px;
	padding-left: 50px;
}
.inquiry-list > .check-inquiry > ul > li > .onReply > strong {
	display: inline-block;
    width: 70px;
    height: 20px;
    border-radius: 10px;
    color: #fff;
    font-size: 12px;
    text-align: center;
    line-height: 20px;
    background: #00C8F5;
}
.inquiry-list > .check-inquiry > ul > li > .offReply > strong {
	display: inline-block;
    width: 70px;
    height: 20px;
    border-radius: 10px;
    color: #fff;
    font-size: 12px;
    text-align: center;
    line-height: 20px;
    background: #555;
}
.inquiry-list > .check-inquiry > ul > li > .row2 {
	width: 85%;
	height: 100%;
	float: left;
	display: inline-block;
	padding-top: 20px;
}
.inquiry-list > .check-inquiry a {
	float: left;
}

</style>
<link rel="stylesheet" type="text/css" href="/css/style.css">
	<c:choose>
   	 	<c:when  test="${empty inquiryList}">
		<div class="no-inquiry">
				<ul>
					<li class="img-cover">등록하신 1:1문의가 없습니다</li>
				</ul>
		</div>
    	</c:when>
      	<c:otherwise>
      	<div class="check-inquiry">
		 		<ul>
		 			<c:forEach items="${inquiryList}" var="inquiryList">
		 			<li>
		 				<input type="hidden" name="inquiry_no" value="${inquiryList.inquiry_no}">
		 				<input type="hidden" name="user_num" value="${inquiryList.user_id}">
		 				<input type="hidden" name="user_num" value="${inquiryList.inquiry_regDate}">
		 				<c:choose>
							<c:when test="${ inquiryList.reply_no == 0}">
									<div class="offReply"><strong>답변대기</strong></div>
							</c:when>
							<c:otherwise>
									<div class="onReply"><strong>답변완료</strong></div>
							</c:otherwise>
							</c:choose>
		 				<div class="row2"><a href="/service_center/inquiryDetail?inquiry_no=${inquiryList.inquiry_no}"><c:out value="${inquiryList.inquiry_title}" /></a></div>
		 			</li>
		 			</c:forEach>
		 		</ul>
		 </div>
    	</c:otherwise>
	</c:choose>		
