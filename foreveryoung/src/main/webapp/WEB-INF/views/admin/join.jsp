<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).ready(function(){

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
	      	<div>
		        <h2>관리자 등록</h2>
		 	</div>	
		</div>
		
		<div class="row col-lg-3">
		</div>			
		<div class="row">
			<div class="col-lg-6 panel panel-body">
				<form action ="join" method="post">
	
		            	
		            <div class="form-group">
		            	<label>ID</label>
		                <input type="text" class="form-control"  name="admin_id" id="id" placeholder="6~12자 영문 소문자 또는 숫자" required="required">
					</div>
						
		           	<div class="form-group">
		                <label>PASSWORD</label>
		            	<input type="password" name="admin_pw"  class="form-control" id="password" placeholder="6~12자 영문 소문자/대문자/숫자" required="required">
		            </div>
		            	
		            <div class="form-group">
		            	<label>NAME</label>
		            	<input type="text" name="admin_name" class="form-control"  id="name" placeholder="한글 2~10자" required="required">
		       		</div>
		       			
		       			
		       		<div class="form-group">
		            	<label>PHONE</label>
		            	<input type="text" name="admin_phone" class="form-control"  id="phone" placeholder="000-0000-0000" required="required">
		            </div>
		            	
		            <div class="row col-lg-5"></div>	
		            <div>
		            	<input type="submit" class="btn btn-md btn-info" value="가입하기">
		            	<a href="/admin/adminList" class="btn btn-md btn-default">목록으로</a>
		        	</div>
	        	
	    	</form>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->


	    
</body>
</html>