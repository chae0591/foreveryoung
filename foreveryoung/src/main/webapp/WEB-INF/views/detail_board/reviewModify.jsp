<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
</head>
<script>
$(function(){
	var formObj=$('#review')
	
      $("#btnCancle").on("click", function () {
    	  history.go(-1);
      });
      $("#btnModify").on("click", function () {
          formObj.attr("action", "/detail_board/reviewModify")
          formObj.attr("method", "post")
          formObj.submit();
    });
});
</script>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>

	<form:form modelAttribute ="review" action="reviewModify">
	 <form:hidden path="user_num"/>
	 <input type="hidden" name="review_num" value="${review.review_num}">
	 <input type="hidden" name="product_no" value="${review.product_no}">
		<div>
		     <h1>리뷰 수정</h1>
		</div>
		       
      <div>
           <label>제목</label><br><br>
           	<p><form:input path="review_title"/></p>
      </div>
                     
      <div>
           <label>리뷰내용</label><br><br>
           <p><form:textarea cols="50" rows="5" path="review_content"/></p>
      </div>

      <div>
           <label>리뷰점수</label><br><br>
           <input type="radio" name="review_score" value="1" checked/>1점
           <input type="radio" name="review_score" value="2"/>2점
           <input type="radio" name="review_score" value="3"/>3점
           <input type="radio" name="review_score" value="4"/>4점
           <input type="radio" name="review_score" value="5"/>5점
      </div>
   </form:form>
      
      <div>
         <button type="submit" id="btnModify">수정</button>
         <button type="button" id="btnCancle">취소</button>
      </div>         
	
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>