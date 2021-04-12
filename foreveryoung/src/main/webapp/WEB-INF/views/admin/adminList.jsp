<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>




<script>
	$(document).ready(function(){
		$("#admin_join").click(function(){
			self.location = "/admin/join"
		})
		$("#admin_modify").click(function(){
			//self.location = "/admin/"
		})
		$("#admin_delete").click(function(){
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
				<h2>관리자 리스트</h2>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<input type="button" id="admin_join" value="관리자 등록">
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
			
				<table border="1">
					<tr>
						<th align="center" width="100">관리자번호</th>
						<th align="center" width="100">관리자ID</th>
						<th align="center" width="100">관리자 이름</th>
						<th align="center" width="160">전화번호</th>
						<th align="center" width="160">등록일</th>
						<th align="center" width="160"> </th>
					</tr>
					
							<c:choose>
						<c:when test="${empty adminList}">
							<tr>
								<td colspan="6">
									관리자 계정이 없습니다.
								</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${adminList}" var="adminList">
								<tr>
									<td align="center">${adminList.admin_no}</td>
									<td align="center">${adminList.admin_id}</td>
									<td align="center">${adminList.admin_name}</td>
									<td align="center">${adminList.admin_phone}</td>
									<td align="center">${adminList.admin_regDate}</td>
									<td align="center">
										<a id="admin_modify" href="/admin/adminModify?admin_no=${adminList.admin_no}">수정</a>
										<a id="admin_delete" href="/admin/adminDelete?admin_no=${adminList.admin_no}" >삭제</a>
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

	</div>	<!--/.main-->


</body>
</html>