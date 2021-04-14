<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>   
    
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
			<li class="active"><a href="/admin/customerList"><em class="fa fa-calendar">&nbsp;</em> 고객관리</a></li>
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
				<h2>고객 리스트</h2>
				<!-- 고객수 -->
				<c:set var="customerCount" value="${fn:length(customerList)}" />
				<c:out value="${customerCount}"/>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			
				<table class="table table-hover">
				
					<thead>
						<tr>
							<th align="center" width="100">고객 번호</th>
							<th align="center" width="100">고객  ID</th>
							<th align="center" width="100">고객 이름</th>
							<th align="center" width="160">전화번호</th>
							<th align="center" width="160">생년월일</th>
							<th align="center" width="160">가입일</th>
						</tr>					
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty customerList}">
								<tr>
									<td colspan="6">
										고객 계정이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${customerList}" var="customerList">
									<tr>
										<td align="center">${customerList.user_num}</td>
										<td align="center">${customerList.user_id}</td>
										<td align="center">${customerList.user_name}</td>
										<td align="center">${customerList.user_phone}</td>
										<td align="center">${customerList.user_birth}</td>
										<td align="center">${customerList.user_regDate}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>					
					</tbody>
					
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