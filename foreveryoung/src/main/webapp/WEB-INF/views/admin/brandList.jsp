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
		$("#brand_product").click(function(){
			//self.location = ""
		})
		
		// 페이징
		var pagingForm = $("#pagingForm");
		$(".paginate_button a").on("click", function(e) {
			e.preventDefault();
			pagingForm.find("input[name='pageNum']").val($(this).attr("href"));
			pagingForm.submit();
		});		

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
			<li class="active"><a href="/admin/brandList"><em class="fa fa-calendar">&nbsp;</em> 판매자관리</a></li>
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
				<h2>브랜드 리스트</h2>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<table  class="table table-hover">
					<thead>
						<tr>
							<th align="center" width="100">브랜드 번호</th>
							<th align="center" width="100">브랜드 ID</th>
							<th align="center" width="100">브랜드  이름</th>
							<th align="center" width="160">전화번호</th>
							<th align="center" width="160">가입일</th>
							<th align="center" width="160"></th>
						</tr>					
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty brandList}">
								<tr>
									<td colspan="6">
										브랜드 계정이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${brandList}" var="brandList">
									<tr>
										<td align="center">${brandList.brand_num}</td>
										<td align="center">${brandList.brand_id}</td>
										<td align="center">${brandList.brand_name}</td>
										<td align="center">${brandList.brand_phone}</td>
										<td align="center">${brandList.brand_regDate}</td>
										<td align="center">
											<input type="button" id="brand_product" class="btn btn-md btn-primary" value="상품목록">
										</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>					
					</tbody>

				</table>
			</div>
		</div><!--/.row-->
		
	<div class="text-center">
		<ul class="pagination">
			<c:if test="${page.prev}">
				<li class="paginate_button previous">
					<a href="${page.startPage-1}">Prev</a>
				</li>
			</c:if>
			
			<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
				<li class="paginate_button ${page.pageNum == num ? "active":""} ">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>
			
			<c:if test="${page.next}">
				<li class="paginate_button next">
					<a href="${page.endPage+1}">Next</a>
				</li>
			</c:if>
		</ul>
		
	</div>
	<form id='pagingForm' action="/admin/brandList" method="get">
	<input type="hidden" name="brand" value="${brand}">
	   	<input type="hidden" name='pageNum' value='${page.pageNum}'>
	   	<input type="hidden" name='amount' value='${page.amount}'>
   </form>			
		
		
		
		
		
		
		
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