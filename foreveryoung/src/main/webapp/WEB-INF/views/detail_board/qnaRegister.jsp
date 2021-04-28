<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<script>
$(function(){
	var formObj=$('.qnaRegister')

  $("#btnCancle").on("click", function () {
	  history.go(-1);
  });
  $("#btnRegister").on("click", function () {
	  alert("글을 등록시 수정/삭제 할 수 없습니다. 등록하시겠습니까?");
      formObj.attr("action", "/detail_board/qnaRegister")
      formObj.attr("method", "post")
      formObj.submit();
});
});
</script>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>
   <form action ="qnaRegister" method="post" id="qnaRegister">
    <input type="hidden" name="user_num" value="${check}">
    <input type="hidden" name="product_no" value="${getDetail.product_no}">
      <div>
           <h1>QnA 작성</h1>
      </div>   
       
      <div>
           <input type="text" name="qna_state" id="qna_state" value="답변대기" readonly>
      </div>
      
      <div>
           <label>제목</label><br><br>
           <input type="text" name="write_title" id="write_title">
      </div>
      
      <div>
           <label>리뷰내용</label><br><br>
           <textarea  cols="50" rows="5" name="write_context" id="write_context"></textarea>
      </div>      
      
      <div>
         <button type="submit" id="btnRegister">등록</button>
         <button type="button" id="btnCancle">취소</button>
      </div>       
   </form>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>