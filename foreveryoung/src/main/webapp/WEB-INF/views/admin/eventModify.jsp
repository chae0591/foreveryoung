<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(document).ready(function(){
	var formObj = $("#eventModify")
	
	$("#event_complete").click(function(){
		formObj.attr("action", "/admin/eventModify")
		formObj.attr("method", "post")
		formObj.submit();
	})
	
	$("event_list").click(function(){
		self.location = "/admin/eventList"
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
			<li class="active"><a href="/admin/eventList"><em class="fa fa-toggle-off">&nbsp;</em> 이벤트관리</a></li>
			<li><a href="/admin/noticeList"><em class="fa fa-clone">&nbsp;</em> 공지사항 관리</a></li>
			<li><a href="/admin/inquiryList"><em class="fa fa-clone">&nbsp;</em> 1:1문의 관리</a></li>
			<li><a href="#"><em class="fa fa-clone">&nbsp;</em> 리뷰신고관리</a></li>
			<li><a href="/admin/static"><em class="fa fa-bar-chart">&nbsp;</em> 통계</a></li>
		</ul>
	</div><!--/.sidebar-->	
	
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	
		<div class="row">
			<div class="col-lg-12">
				<h2>이벤트 정보 수정</h2>		
			</div>
		</div><!--/.row-->	
	
		<div class="row">
			<div class="col-lg-12">
				<form:form modelAttribute="eventModify" action="eventModify">
				<form:hidden path="event_no"/>
					<table>
							<tr>
								<th align="center" width="100">이벤트 번호</th>
								<td>${eventDetail.event_no}</td>
							</tr>						
							<tr>
								<th align="center" width="100">이벤트명</th>
								<td><form:input path="event_name" /></td>
							</tr>
							<tr>
								<th align="center" width="100">기간</th>
								<td><form:input path="event_start" />
								~<form:input path="event_end" /></td>
							</tr>
							<tr>
								<th align="center" width="100">할인율</th>
								<td><form:input path="event_discount" /></td>			
							</tr>
							<tr>
								<th align="center" width="100">이벤트 적용대상</th>
								<td><form:input path="event_target" /></td>			
							</tr>
					</table>
				</form:form>
				
				<div>
					<button type="submit" id="event_complete">수정 완료</button>
					<button type="submit" id="event_list">이벤트리스트 보기</button>
				</div>				
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->	
		
	
	
	
</body>
</html>