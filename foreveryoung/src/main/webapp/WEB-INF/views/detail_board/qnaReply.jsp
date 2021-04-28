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
	var formObj=$('.qnaReply')

  $("#btnCancle").on("click", function () {
	  history.go(-1);
  });
  $("#btnRegister").on("click", function () {
	  alert("글을 등록시 수정/삭제 할 수 없습니다. 등록하시겠습니까?");
      formObj.attr("action", "/detail_board/qnaReply")
      formObj.attr("method", "post")
      formObj.submit();
});
});
</script>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>
	<form action ="qnaReply" method="post" id="qnaReply">
    <input type="hidden" name="user_num" value="${check}">
    <input type="hidden" name="product_no" value="${getDetail.product_no}">
      <div>
           <h1>QnA 답변 작성</h1>
      </div>      
      <div>
           <label>답변내용</label><br><br>
           <textarea  cols="100" rows="5" name="reply_context" id="reply_context"></textarea>
      </div>      
      
      <div>
         <button type="submit" id="btnRegister">등록</button>
         <button type="button" id="btnCancle">취소</button>
      </div>           
	</form>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>