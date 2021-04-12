<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
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
			<li class="active"><a href="/admin/adminList"><em class="fa fa-calendar">&nbsp;</em> 관리자관리</a></li>
			<li><a href="/admin/brandList"><em class="fa fa-calendar">&nbsp;</em> 판매자관리</a></li>
			<li><a href="/admin/customerList"><em class="fa fa-calendar">&nbsp;</em> 고객관리</a></li>
			<li><a href="/admin/productList"><em class="fa fa-toggle-off">&nbsp;</em> 상품관리</a></li>
			<li><a href="/admin/eventList"><em class="fa fa-toggle-off">&nbsp;</em> 이벤트관리</a></li>
			<li><a href="/admin/noticeList"><em class="fa fa-clone">&nbsp;</em> 공지사항 관리</a></li>
			<li><a href="/admin/inquiryList"><em class="fa fa-clone">&nbsp;</em> 1:1문의 관리</a></li>
			<li><a href="#"><em class="fa fa-clone">&nbsp;</em> 리뷰신고관리</a></li>
			<li><a href="/admin/staticCustomer"><em class="fa fa-bar-chart">&nbsp;</em> 통계(고객분석)</a></li>
			<li><a href="/admin/staticSales"><em class="fa fa-bar-chart">&nbsp;</em> 통계(매출분석)</a></li>
		</ul>
	</div><!--/.sidebar-->	
	
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
	
		<div class="row">
			<div class="col-lg-12">
				<form action ="join" method="post">
		        	<div>
		        		<h1>관리자 등록</h1>
		        	</div>
		            	
		            <div>
		            	<label>ID</label><br><br>
		                <input type="text"  name="admin_id" id="id" placeholder="아이디를 입력해주세요."><br><br>
					</div>
						
		           	<div>
		                <label>PASSWORD</label><br><br>
		            	<input type="password" name="admin_pw" id="password" placeholder="비밀번호를 입력해주세요."><br><br>
		            </div>
		            	
		            <div>
		            	<label>NAME</label><br><br>
		            	<input type="text" name="admin_name" id="name" placeholder="이릅을 입력해주세요"><br><br>
		       		</div>
		       			
		       			
		       		<div>
		            	<label>PHONE</label><br><br>
		            	<input type="text" name="admin_phone" id="phone" placeholder="전화번호를 입력해주세요"><br><br>
		            </div>
		            	
		            	
		            <div>
		            	<input type="submit" value="가입하기">
		        	</div>
	        	
	    	</form>
			</div>
		</div><!--/.row-->
	</div>	<!--/.main-->


	    
</body>
</html>