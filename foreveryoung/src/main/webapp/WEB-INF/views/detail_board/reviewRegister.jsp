<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>
$(document).ready(function () {
	var formObj = $("#detail_board")
	
	$("#btnRegister").on("click", function () {
		formObj.attr("action", "/detail_board/reviewRegister")
		formObj.attr("method", "post")
		formObj.submit();
	})
	
	$("#btnList").on("click", function () {
		self.location = "/detail_board/detail_main"
	})
	$("#btnCancle").on("click", function () {
		self.location = "/detail_board/detail_main"
	})
})
</script>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>
	<form action ="reviewRegister" method="post">
	 <input type="hidden" name="user_num" value="${check}">
   	 <input type="hidden" name="product_no" value="${getDetail.product_no}">
		<div>
		     <h1>리뷰 작성</h1>
		</div>
		       
		<div>
		     <label>제목</label><br><br>
		     <input type="text" name="review_title" id="review_title">
		</div>
		            	
		<div>
		     <label>리뷰내용</label><br><br>
		     <textarea name="review_content" id="review_content"></textarea>
		</div>

		<div>
		     <label>리뷰점수</label><br><br>
		     <input type="number" name="review_score" id="review_score">
		</div>
		<div>
			<button type="submit" id="btnRegister">등록</button>
			<button type="submit" id="btnCancle">취소</button>
			<button type="submit" id="btnList">게시글 보기</button>
		</div>		
	</form>
	
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>