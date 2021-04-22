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
			</div>
		</div><!--/.row-->
		
		<div class="panel panel-container">
			<div class="row">
			
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding">
							<em class="fa fa-xl fa-user  color-teal"></em>
							<div class="large color-black">
									<a href="/admin/adminList"  style="color:black;">
										<c:out value="${fn:length(adminList)}"/>
									</a>
							</div>
							<div class="text-muted">관리자 수 </div>
						</div>
					</div>
				</div>			
			
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding">
							<em class="fa fa-xl fa-shopping-bag color-blue"></em>
							<div class="large">
									<a href="/admin/brandList" style="color:black;">
										<c:out value="${fn:length(brandList)}"/>
									</a>
							</div>
							<div class="text-muted">브랜드 수</div>
						</div>
					</div>
				</div>
				
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding">
							<em class="fa fa-xl fa-users color-orange"></em>
							<div class="large color-black">
									<a href="/admin/customerList"  style="color:black;">
										<c:out value="${fn:length(customerList)}"/>
									</a>
							</div>
							<div class="text-muted">회원 수 </div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding">
							<em class="fa fa-xl fa-shopping-cart color-red"></em>
							<div class="large color-black">
									<a href="/admin/productList"  style="color:black;">
										<c:out value="${fn:length(productList)}"/>
									</a>
							</div>
							<div class="text-muted">상품 수 </div>
						</div>
					</div>
				</div>
				

				
								
			</div>		
		</div>

		
		
		<div class="row">
			<div class="col-lg-12">
			
				<h2>주문처리 현황</h2>
				

			</div>	
		</div><!--/.row-->
		
		<div class="panel panel-container">
			<div class="row">
				<div class="col-xs-6 col-md-2 col-lg-2 no-padding">
					<div class="panel-teal panel-widget border-right">
						<div class="row no-padding">
							<div class="color-blue" >입금대기</div>
							<div class="large color-black">
									<a href="#"  style="color:black;">
										<c:out value="${fn:length(#)}"/>
									</a>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-xs-6 col-md-2 col-lg-2 no-padding">
					<div class="panel-teal panel-widget border-right">
						<div class="row no-padding">
							<div class="color-blue">입금완료</div>
							<div class="large color-black">
									<a href="#"  style="color:black;">
										<c:out value="${fn:length(#)}"/>
									</a>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-xs-6 col-md-2 col-lg-2 no-padding">
					<div class="panel-teal panel-widget border-right">
						<div class="row no-padding">
							<div class="color-blue">배송대기</div>
							<div class="large color-black">
									<a href="#"  style="color:black;">
										<c:out value="${fn:length(#)}"/>
									</a>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-xs-6 col-md-2 col-lg-2 no-padding">
					<div class="panel-teal panel-widget border-right">
						<div class="row no-padding">
							<div class="color-blue">배송완료</div>
							<div class="large color-black">
									<a href="#"  style="color:black;">
										<c:out value="${fn:length(#)}"/>
									</a>
							</div>
						</div>
					</div>
				</div>	
				<div class="col-xs-6 col-md-2 col-lg-2 no-padding">
					<div class="panel-teal panel-widget border-right">
						<div class="row no-padding">
							<div class="color-blue">교환</div>
							<div class="large color-black">
									<a href="#"  style="color:black;">
										<c:out value="${fn:length(#)}"/>
									</a>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-2 col-lg-2 no-padding">
					<div class="panel-teal panel-widget border-right">
						<div class="row no-padding">
							<div class="color-blue">환불</div>
							<div class="large color-black">
									<a href="#"  style="color:black;">
										<c:out value="${fn:length(#)}"/>
									</a>
							</div>
						</div>
					</div>
				</div>																	
			</div>
		</div>
		
		<div class="row">
			<div class="col-lg-12">
				<h2>클레임 현황</h2>
			</div>

			<div class="col-lg-3">
				
				<button id="inquiry_list" class="btn btn-lg btn-primary">1:1문의</button>
				<button id="report_list"  class="btn btn-lg btn-warning">상품 리뷰 신고</button>
			</div>	
			<div class="col-lg-12">
				<h2>캘린더</h2>
			</div>		
			<div class="col-md-6">
				<div class="panel panel-default" >
					<div class="panel-heading">
						
					</div>	
					<div class="panel-body">
						<div id="calendar"></div>
					</div>
				</div>
			</div><!--/.col-->		
		</div>	
		
	<script src="../css/admin/js/jquery-1.11.1.min.js"></script>
	<script src="../css/admin/js/bootstrap.min.js"></script>
	<script src="../css/admin/js/chart.min.js"></script>
	<script src="../css/admin/js/chart-data.js"></script>
	<script src="../css/admin/js/easypiechart.js"></script>
	<script src="../css/admin/js/easypiechart-data.js"></script>
	<script src="../css/admin/js/bootstrap-datepicker.js"></script>
	<script src="../css/admin/js/custom.js"></script>
		
	</div>	<!--/.main-->
	
	
</body>
</html>