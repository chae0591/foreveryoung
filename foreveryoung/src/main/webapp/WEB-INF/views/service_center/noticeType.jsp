<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
$(document).ready(function(){
	
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
	
});
</script>
    <c:choose>
	<c:when test="${empty map.noticeList}">
		<div class="no-notice">
				<ul>
					<li class="img-cover">검색어에 맞는 결과가 없습니다</li>
				</ul>
		</div>
	</c:when>
	<c:otherwise>
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
		</c:otherwise>
		</c:choose>