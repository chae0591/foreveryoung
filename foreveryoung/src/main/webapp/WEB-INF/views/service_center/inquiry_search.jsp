<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
		 				<div class="row1"><strong>답변대기</strong></div>
		 				<div class="row2"><a href="/service_center/inquiryDetail?inquiry_no=${inquiryList.inquiry_no}"><c:out value="${inquiryList.inquiry_title}" /></a></div>
		 			</li>
		 			</c:forEach>
		 		</ul>
		 </div>
    	</c:otherwise>
	</c:choose>		
