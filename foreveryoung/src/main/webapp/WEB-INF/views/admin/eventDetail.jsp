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
		var formObj = $('#eventDetail')
		
		$("#event_modify").click(function(){
			var event_no = $("#event_no");
			var event_noVal = event_no.val();
			self.location = "/admin/eventModify?event_no=" +event_noVal
		})
		
		$("#event_delete").click(function(){
			 window.alert("관리자 계정이 삭제되었습니다");
				formObj.attr("action" , "/admin/eventDelete")
				formObj.submit();
		})
		
		$("#event_list").click(function(){
			self.location ="/admin/eventList"
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
				<h2>이벤트 상세보기</h2>
			</div>
		</div><!--/.row-->
	
		<div class="row">
			<div class="col-lg-1">
			</div>
			<div class="col-lg-10 panel panel-default btn-margins">
			
			<div class="panel-heading">이벤트 정보</div>
				<form:form modelAttribute="eventDetail">
						<table  class="table panel-body">
							<tr>
								<th align="center">이벤트 번호</th>
								<td><form:hidden path="event_no" readonly="true"/>${eventDetail.event_no}</td>
							</tr>						
							<tr>
								<th align="center">이벤트명</th>
								<td>${eventDetail.event_name}</td>
							</tr>
							<tr>
								<th align="center">기간</th>
								<td>${eventDetail.event_start} ~ ${eventDetail.event_end}</td>
							</tr>
							<tr>
								<th align="center">할인율</th>
								<td>${eventDetail.event_discount}%</td>			
							</tr>
							<tr>
								<th align="center">이벤트 적용대상</th>
								<td>${eventDetail.event_target}</td>			
							</tr>						
						</table>			
				</form:form>
			</div>
		</div><!--/.row-->
		
		<div class="row">
		
			<div class="col-lg-5"></div>
			<div class="col-lg-5">
				<button id="event_modify" class="btn btn-md btn-info">수정</button>
				<button id="event_delete" class="btn btn-md btn-danger">삭제</button>
				<button id="event_list" class="btn btn-md btn-default">목록으로</button>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->
	
</body>
</html>