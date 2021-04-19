<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>



<script>
	$(document).ready(function(){
		$("#event_register").click(function(){
			self.location = "/admin/eventRegister"
		})
		$("#event_modify").click(function(){
			//self.location = "/admin/"
		})
		$("#event_delete").click(function(){
			//self.location = "/admin/"
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
				<h2>이벤트 리스트</h2>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<input type="button" id="event_register" value="이벤트 등록">
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<table class="table table-hover">
				
					<thead>
						<tr>
							<th align="center" width="100">이벤트 번호</th>
							<th align="center" width="100">이벤트명</th>
							<th align="center" width="100">이벤트 기간</th>
							<th align="center" width="100">이벤트 할인율</th>
							<th align="center" width="160">이벤트 적용대상</th>
							<th align="center" width="100">진행상황</th>
							<th align="center" width="160"></th>
						</tr>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty eventList}">
								<tr>
									<td colspan="7">
										이벤트가 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${eventList}" var="eventList">
									<tr>
										<td align="center">${eventList.event_no}</td>
										<td align="center">${eventList.event_name}</td>
										<td align="center">${eventList.event_start}~
															${eventList.event_end } 
										</td>
										<td align="center">${eventList.event_discount}%</td>						
										<td align="center">${eventList.event_target}</td>
										<td align="center">진행상황</td>
										<td align="center">
											<a id="event_detail" href="/admin/eventDetail?event_no=${eventList.event_no}">상세보기</a>
										</td>
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

	</div>	<!--/.main-->

	

	
	
</body>
</html>