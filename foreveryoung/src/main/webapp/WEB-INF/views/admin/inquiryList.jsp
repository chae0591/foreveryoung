<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>  	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<h2>1:1문의 리스트</h2>
			</div>
		</div><!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<table border="1">
					<tr>
						<th align="center" width="100"> 번호</th>
						<th align="center" width="100">제목</th>
						<th align="center" width="100">작성자</th>
						<th align="center" width="100">등록일</th>
						<th align="center" width="100">상태</th>
			
					</tr>
			
					<c:choose>
						<c:when test="${empty inquiryList}">
							<tr>
								<td colspan="5">1:1문의가  없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>s
							<c:forEach items="${inquiryList}" var="inquiryList">
								<tr>
									<td align="center">${inquiryList.inquiry_no}</td>
									<td align="center">${inquiryList.inquiry_title}</td>
									<td align="center">${inquiryList.user_id}</td>
									<td align="center">${inquiryList.inquiry_regDate}</td>
									<td align="center">
										<a href="/admin/inquiryDetail?inquiry_no=${inquiryList.inquiry_no}">
										${inquiryList.inquiry_status}</a> 
									</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div><!--/.row-->

	</div>	<!--/.main-->






</body>
</html>