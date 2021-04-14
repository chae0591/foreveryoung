<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){
		$("#inquiry_list").click(function(){
			self.location = "/admin/inquiryList"
		})
		$("#report_list").click(function(){
			//self.location = "/admin/reportList"
		})
		
	})

</script> 


</head>
<body>
<jsp:include page="../admin/adminTemplate/header.jsp"></jsp:include>

		<!-- 사이드바 -->
		<div id="sidebar-collapse" class="col-sm-3 col-lg-2 sidebar">
		<ul class="nav menu">
			<li class="active"><a href="/admin/dashBoard"><em class="fa fa-dashboard">&nbsp;</em> 대시보드</a></li>
			<li><a href="/admin/adminList"><em class="fa fa-calendar">&nbsp;</em> 관리자관리</a></li>
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
				<h1>대시보드</h1>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h2>전체 현황</h2>
				<table border="1">
					<tr>
						<th align="center">회원 수</th>
						<th align="center">브랜드 수</th>
						<th align="center">상품 수</th>
					</tr>
					<tr>
						<td align="center">
							<a href="/admin/customerList">
								<c:out value="${fn:length(customerList)}"/>
							</a>
						</td>
						<td align="center">
							<a href="/admin/brandList">
								<c:out value="${fn:length(brandList)}"></c:out>
							</a>
						</td>
						<td align="center">
							<a href="/admin/productList">
								<c:out value="${fn:length(productList)}"></c:out>
							</a>
							
						</td>
					</tr>
					
				</table>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			
				<h2>주문처리 현황</h2>
				
				<table border="1">
					<tr>
						<th align="center">입금 대기</th>
						<th align="center">입금 완료</th>
						<th align="center">배송 대기</th>
						<th align="center">배송 대기</th>
						<th align="center">환불</th>
						
					</tr>
					<tr>
						<td align="center">아직</td>
						<td align="center">아직</td>
						<td align="center">아직</td>
						<td align="center">아직</td>
						<td align="center">아직</td>
		
					</tr>
					
				</table>
			</div>	
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h2>클레임 현황</h2>
				
				<button id="inquiry_list">1:1문의</button>
				<button id="report_list">상품 리뷰 신고</button>
			</div>	
		</div><!--/.row-->
		
		
	</div>	<!--/.main-->
	
</body>
</html>