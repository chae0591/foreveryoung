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
		$(".eventList_btn").click(function(){
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
				<form action ="eventRegister" method="post">
		        	<div>
		        		<h1>이벤트 등록</h1>
		        	</div>
		            	
		            <div>
		            	<label>이벤트명</label><br><br>
		                <input type="text"  name="event_name" id="event_name" placeholder="이벤트명을 입력해주세요."><br><br>
					</div>
						
		           	<div>
		                <label>이벤트기간</label><br><br>
		            	<input type="date" name="event_start" id="event_start"> ~
		            	<input type="date" name="event_end" id="event_end">
		            	<br><br>
		            </div>
		            	
		            <div>
		            	<label>이벤트 할인율</label><br><br>
		            	<input type="text" name="event_discount" id="event_discount" >%<br><br>
		       		</div>
		       			
		       			
		       		<div>
		            	<label>이벤트 적용대상</label><br><br>
		            	<input type="text" name="event_target" id="event_target"><br><br>
		            </div>
		            	
		            	
		            <div>
		            	<input type="submit"  value="등록">
		            	<input type="button" class="eventList_btn" value="취소">
		        	</div>
		        	
		    	</form>
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