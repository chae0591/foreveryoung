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
		$(".noticeList_btn").click(function(){
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
		    <div>
		        <h1>공지사항 등록</h1>
		    </div>
		</div>

		<div class="row col-lg-3">
		</div>	
		<div class="row">
			<div class="col-lg-6 panel panel-body">
				<form action ="noticeRegister" method="post">
		            	
		            <div  class="form-group">
		            	<label>분류</label><br><br>
							<select name="notice_type" id="notice_type" class="form-control" required="required" >
							    <option value="">분류선택</option>
							    <option value="회원">회원</option>
							    <option value="주문/결제">주문/결제</option>
							    <option value="배송">배송</option>
							    <option value="교환/환불/반품">교환/환불/반품</option>
							    <option value="이벤트/쿠폰">이벤트/쿠폰</option>					    
							    <option value="판매자">판매자</option>
							    <option value="기타">기타</option>
							</select>
					</div>
						
		           	<div class="form-group">
		                <label>제목</label><br><br>
		            	<input type="text" name="notice_title" id="notice_title" class="form-control" required="required">
		
		            	<br><br>
		            </div>
		            	
		            <div class="form-group">
		            	<label>공지글</label><br><br>
		            	<textarea name="notice_content" id="notice_content" cols="50" rows="20" class="form-control" required="required"  style="resize: vertical;"></textarea>
		       		</div>
		            
		            <div class="row col-lg-5"></div>		
		            <div>
		            	<input type="submit" class="btn btn-md btn-info" value="등록">
		            	<input type="button" class="noticeList_btn btn btn-md btn-default" value="취소">
		        	</div>
		        	
		    	</form>
			</div>
		</div><!--/.row-->
		
		
		<div class="row">
			<div class="col-lg-12">
			
			</div>
		</div><!--/.row-->
		
	</div>	<!--/.main-->	


    	
</body>
</html>