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
		var formObj = $('#adminDetail')
		
		$("#admin_modify").click(function(){
			var admin_no = $("#admin_no");
			var admin_noVal = admin_no.val();
			self.location = "/admin/adminModify?admin_no=" +admin_noVal
		})
		
		$("#admin_delete").click(function(){
			 window.alert("관리자 계정이 삭제되었습니다");
				formObj.attr("action" , "/admin/adminDelete")
				formObj.submit();
		})
		
		$("#admin_list").click(function(){
			self.location ="/admin/adminList"
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
			<li class="active"><a href="/admin/adminList"><em class="fa fa-calendar">&nbsp;</em> 관리자관리</a></li>
			<li><a href="/admin/brandList"><em class="fa fa-calendar">&nbsp;</em> 판매자관리</a></li>
			<li><a href="/admin/customerList"><em class="fa fa-calendar">&nbsp;</em> 고객관리</a></li>
			<li><a href="/admin/productList"><em class="fa fa-toggle-off">&nbsp;</em> 상품관리</a></li>
			<li><a href="/admin/eventList"><em class="fa fa-toggle-off">&nbsp;</em> 이벤트관리</a></li>
			<li><a href="/admin/noticeList"><em class="fa fa-clone">&nbsp;</em> 공지사항 관리</a></li>
			<li><a href="/admin/inquiryList"><em class="fa fa-clone">&nbsp;</em> 1:1문의 관리</a></li>
			<li><a href="#"><em class="fa fa-clone">&nbsp;</em> 리뷰신고관리</a></li>
			<li><a href="/admin/static"><em class="fa fa-bar-chart">&nbsp;</em> 통계</a></li>
		</ul>
	</div><!--/.sidebar-->	
	
	
	
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	
		<div class="row">
			<div class="col-lg-12">
				<h2>관리자 상세보기</h2>
			</div>
		</div><!--/.row-->	
		<div class="row">
			<div class="col-lg-1">
			</div>
			<div class="col-lg-10 panel panel-default btn-margins">
			
				
				<div class="panel-heading">관리자 정보</div>
				<form:form modelAttribute="adminDetail">
						<table class="table panel-body">
							<tr>
								<th align="center">관리자 번호</th>
								<td><form:hidden path="admin_no" readonly="true"/>${adminDetail.admin_no}</td>
							</tr>						
							<tr>
								<th align="center">ID</th>
								<td>${adminDetail.admin_id}</td>
							</tr>
							<tr>
								<th align="center">관리자 이름</th>
								<td>${adminDetail.admin_name}</td>
							</tr>
							<tr>
								<th align="center">관리자 전화번호</th>
								<td>${adminDetail.admin_phone}</td>			
							</tr>
							<tr>
								<th align="center">관리자 등록일</th>
								<td>${adminDetail.admin_regDate}</td>			
							</tr>							
						</table>			
				</form:form>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-lg-5"></div>
			
			<div class="col-lg-5">
				<button id="admin_modify" class="btn btn-md btn-info">수정</button>
				<button id="admin_delete" class="btn btn-md btn-danger">삭제</button>
				<button id="admin_list" class="btn btn-md btn-default">목록으로</button>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->	

</body>
</html>