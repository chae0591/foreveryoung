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
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
$(function(){
		var formObj=$('#reviewRegister')
	
      $("#btnCancle").on("click", function () {
    	  history.go(-1);
      });
      $("#btnRegister").on("click", function () {
          formObj.attr("action", "/detail_board/reviewRegister")
          formObj.attr("method", "post")
          formObj.submit();
    });
});
</script>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>
   <form action ="reviewRegister" method="post" id="reviewRegister">
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
           <textarea  cols="50" rows="5" name="review_content" id="review_content"></textarea>
      </div>

      <div>
           <label>리뷰점수</label><br><br>
           <input type="radio" name="review_score" value="1" checked/>1점
           <input type="radio" name="review_score" value="2"/>2점
           <input type="radio" name="review_score" value="3"/>3점
           <input type="radio" name="review_score" value="4"/>4점
           <input type="radio" name="review_score" value="5"/>5점
      </div>
      
      <div>
         <button type="submit" id="btnRegister">등록</button>
         <button type="button" id="btnCancle">취소</button>
      </div>         
   </form>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>