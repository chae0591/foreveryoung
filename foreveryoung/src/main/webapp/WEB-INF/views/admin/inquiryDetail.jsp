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
		var formObj = $('#inquiryStatusComplete')
		var formObj1 = $("#replyRegister")
		
		
		
		$("#completeBtn").click(function(){
			formObj.attr("action", "/admin/inquiryStatusComplete")
			formObj.attr("method" , "post")
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
			<li><a href="/admin/staticCustomer"><em class="fa fa-bar-chart">&nbsp;</em> 통계(고객분석)</a></li>
			<li><a href="/admin/staticSales"><em class="fa fa-bar-chart">&nbsp;</em> 통계(매출분석)</a></li>
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
					<form:hidden path="inquiry_no"/>
		
						<table border="1">
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
					<form:hidden path="inquiry_status"/>
					<form:hidden path="user_num"/>
				</form:form>
			</div>
		</div><!--/.row-->
		
		<!-- inquiry_status 답변대기:답변등록form, 답변완료:답변보기 form-->
		<c:choose>
			<c:when test="${inquiryDetail.inquiry_status eq '답변대기'}">
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
					                <input type="submit" id="replyRegisterBtn" value="답변등록">
					                <input type="button" value="답변삭제">
								</div>
					    	</form>
						</div>
					</div><!--/.row-->
					
					<!-- inquiry_status 답변완료로 변경 -->
					<form:form modelAttribute="inquiryStatusComplete" action="inquiryStatusComplete">
						<input type="text" name="inquiry_no" value="${inquiryDetail.inquiry_no}">
						<input type="submit" id="completeBtn" value="답변완료"> 
					</form:form>
					
			</c:when>
			
			<c:when test="${inquiryDetail.inquiry_status eq '답변완료'}">
					<!-- 답변보기form -->
					<div class="row">
						<div class="col-lg-12">
								<div>
					                <textarea style="width:400px; height:300px; " >
					                	<c:out value="${inquiryDetail.reply_content}"></c:out>
					                </textarea>
					                <br><br>
					                <input type="submit" value="답변수정">
					                <input type="button" value="답변삭제">
								</div>
						</div>
					</div><!--/.row-->
			</c:when>
		</c:choose>
	
	</div>	<!--/.main-->
	
	
	
	
</body>
</html>