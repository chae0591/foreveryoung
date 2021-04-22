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
		var formObj = $("#noticeModify")
		
		$("#notice_complete").click(function(){
			formObj.attr("action", "/admin/noticeModify")
			formObj.attr("method" , "post")
			formObj.submit();
		})
		
		$("#noticeList").click(function(){
			self.location = "/admin/noticeList"
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
			<li><a href="/admin/static"><em class="fa fa-bar-chart">&nbsp;</em> 통계</a></li>
		</ul>
	</div><!--/.sidebar-->	
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	
		<div class="row">
			<div class="col-lg-12">
				<h2>공지사항 수정</h2>		
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-1">
			</div>
			<div class="col-lg-10 panel panel-default btn-margins">
				<div class="panel-heading"></div>
				<form:form modelAttribute="noticeModify" action="noticeModify" >
					<form:hidden path="notice_no"/>
					
					<table class="table panel-body">
					
						<tr>
							<th align="center">공지사항 번호</th>
							<td>${noticeDetail.notice_no}</td>
						</tr>	
						<tr>
							<td align="center">분류</td>
							<td>
								<form:select path="notice_type" class="form-control">
									<form:option value="회원" label="회원"></form:option>
									<form:option value="주문/결제" label="주문/결제"></form:option>
									<form:option value="배송" label="배송"></form:option>
									<form:option value="교환/환불/반품" label="교환/환불/반품"></form:option>
									<form:option value="이벤트/쿠폰" label="이벤트/쿠폰"></form:option>
									<form:option value="판매자" label="판매자"></form:option>
									<form:option value="기타" label="기타"></form:option>
								</form:select>
							</td>
						</tr>
						<tr>
							<td align="center">제목</td>
							<td><form:input path="notice_title" class="form-control"/></td>
						</tr>
						<tr>
							<td align="center">공지사항 내용</td>
							<td><form:textarea cols="50" rows="20" path="notice_content" class="form-control"  style="resize: vertical;"/></td>
						</tr>
					</table>
				</form:form>
				</div>
			</div><!--/.row-->
				
			<div class="row">
				<div class="col-lg-5"></div>
			
				<div class="col-lg-5">
					<button type="submit" id="notice_complete"  class="btn btn-md btn-info">수정 완료</button>
					<button type="submit" id="noticeList" class="btn btn-md btn-default">목록으로</button>
				</div>
			
			</div>

	
	</div>	<!--/.main-->	
	
</body>
</html>