<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){
		var formObj = $('#noticeDetail')
		
		$("#notice_modify").click(function(){
			var notice_no = $("#notice_no");
			var notice_noVal = notice_no.val();
			self.location = "/admin/noticeModify?notice_no=" + notice_noVal
		})
		$("#notice_delete").click(function(){
			formObj.attr("action" , "/admin/noticeDelete")
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
			<li class="active"><a href="/admin/noticeList"><em class="fa fa-clone">&nbsp;</em> 공지사항 관리</a></li>
			<li><a href="/admin/inquiryList"><em class="fa fa-clone">&nbsp;</em> 1:1문의 관리</a></li>
			<li><a href="#"><em class="fa fa-clone">&nbsp;</em> 리뷰신고관리</a></li>
			<li><a href="/admin/staticCustomer"><em class="fa fa-bar-chart">&nbsp;</em> 통계(고객분석)</a></li>
			<li><a href="/admin/staticSales"><em class="fa fa-bar-chart">&nbsp;</em> 통계(매출분석)</a></li>
		</ul>
	</div><!--/.sidebar-->	
	
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	
		<div class="row">
			<div class="col-lg-12">
				<h2>공지사항 상세보기</h2>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<form:form modelAttribute="noticeDetail">
					<form:hidden path="notice_no"/>
					
						<table border="1">
							<tr>
								<th align="center" width="100">분류</th>
								<td><form:input path="notice_type" readonly="true"/></td>
							</tr>
							<tr>
								<th align="center" width="100">제목</th>
								<td><form:input path="notice_title" readonly="true"/></td>
							</tr>
							<tr>
								<th align="center" width="100">공지글 내용</th>
								<td><form:input path="notice_content" readonly="true"/></td>			
							</tr>
						</table>			
					<form:hidden path="admin_no"/>
				</form:form>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-lg-12">
				<button id="notice_modify">수정</button>
				<button id="notice_delete">삭제</button>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->	

</body>
</html>