<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>


<script>
	$(document).ready(function(){
		var formObj = $('#inquiryDetail')
		
		$('#inquiry_list').click(function(){
			self.location="/admin/inquiryList"
		})
		
		$('#reply_modify').click(function(){
			var inquiry_no = $('#inquiry_no');
			var inquiry_noVal = inquiry_no.val();
			self.location = "/admin/replyModify?inquiry_no=" +inquiry_noVal
		})
		
		$('#reply_delete').click(function(){
			window.alert("1:1문의 답변이 삭제되었습니다");
			formObj.attr("action","/admin/replyDelete")
			formObj.submit();
		})

		
	})

</script>

</head>
<body>

<jsp:include page="../admin/adminTemplate/header.jsp"></jsp:include>

		<!-- 사이드바 -->
		<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li><a href="/admin/dashBoard"><em class="fa fa-dashboard">&nbsp;</em> 대시보드</a></li>
			<li><a href="/admin/adminList"><em class="fa fa-calendar">&nbsp;</em> 관리자관리</a></li>
			<li><a href="/admin/brandList"><em class="fa fa-calendar">&nbsp;</em> 판매자관리</a></li>
			<li><a href="/admin/customerList"><em class="fa fa-calendar">&nbsp;</em> 고객관리</a></li>
			<li><a href="/admin/productList"><em class="fa fa-toggle-off">&nbsp;</em> 상품관리</a></li>
			<li><a href="/admin/eventList"><em class="fa fa-toggle-off">&nbsp;</em> 이벤트관리</a></li>
			<li><a href="/admin/noticeList"><em class="fa fa-clone">&nbsp;</em> 공지사항 관리</a></li>
			<li class="active"><a href="/admin/inquiryList"><em class="fa fa-clone">&nbsp;</em> 1:1문의 관리</a></li>
			<li><a href="#"><em class="fa fa-clone">&nbsp;</em> 리뷰신고관리</a></li>
			<li><a href="/admin/static"><em class="fa fa-bar-chart">&nbsp;</em> 통계</a></li>
		</ul>
	</div><!--/.sidebar-->	



	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	
		<div class="row">
			<div class="col-lg-12">
				<h2> 1:1문의 답변하기</h2>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-lg-12">
				<form:form modelAttribute="inquiryDetail">
						<table border="1">
							<tr>
								<th align="center" width="100">1:1문의 번호</th>
								<td><form:input path="inquiry_no" readonly="true"/></td>
							</tr>
							<tr>
								<th align="center" width="100">제목</th>
								<td><form:input path="inquiry_title" readonly="true"/></td>
							</tr>
							<tr>
								<th align="center" width="100">작성자</th>
								<td><form:input path="user_id" readonly="true"/></td>
							</tr>
							<tr>
								<th align="center" width="100">등록일</th>
								<td><form:input path="inquiry_regDate" readonly="true"/></td>			
							</tr>
							<tr>
								<th align="center" width="100">문의 내용</th>
								<td><form:input path="inquiry_content" readonly="true"/></td>			
							</tr>
							
						</table>			
				</form:form>
			</div>
		</div><!--/.row-->
		
		<c:choose>
			<c:when test="${ inquiryDetail.reply_no == 0}">
					<!-- 답변등록form -->
					<div class="row">
						<div class="col-lg-12">
							<form action ="replyRegister" method="post">
					        	<div>
					        		<h1>답변하기</h1>
					        	</div>
					            	
					            <div>
					                <textarea name="reply_content" style="width:400px; height:300px; " required="required" ></textarea>
					                <input type="hidden" name="inquiry_no"  value="${inquiryDetail.inquiry_no}">
					                <br><br>
					                <input type="submit"  value="답변등록">
					                <input type="button" id="inquiry_List" value="1:1문의 목록으로">
								</div>
					    	</form>
						</div>
					</div><!--/.row-->
			</c:when>
			
			<c:otherwise>
					<!-- 답변보기form -->
					<div class="row">
						<div class="col-lg-12">
								<div>
					                <textarea style="width:400px; height:300px; " >
					                	<c:out value="${inquiryDetail.reply_content}"></c:out>
					                </textarea>
					                <br><br>
					                <input type="button" id="reply_modify" value="답변수정">
					                <input type="button" id="reply_delete" value="답변삭제">
								</div>
						</div>
					</div><!--/.row-->
			</c:otherwise>
		</c:choose>
	
	</div>	<!--/.main-->
	
	
	
	
</body>
</html>