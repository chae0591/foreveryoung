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
			<li><a href="/admin/brandList"><em class="fa fa-calendar">&nbsp;</em> 판매자관리</a></li>
			<li><a href="/admin/customerList"><em class="fa fa-calendar">&nbsp;</em> 고객관리</a></li>
			<li  class="active"><a href="/admin/productList"><em class="fa fa-toggle-off">&nbsp;</em> 상품관리</a></li>
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
				<h2>상품 리스트</h2>
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-3"></div>	
			<div class="col-lg-6">
				<p>통합검색</p>
						<label>카테고리</label>
						<select class="form-control">
							<option>카테고리 선택</option>
							<c:forEach items="${productList}" var="productList">
								<option>${productList.product_category}</option>
							</c:forEach>
						</select>


						<label>브랜드</label>
						<select class="form-control">
							<option>브랜드 선택</option>
							<c:forEach items="${brandList}" var="brandList">
								<option>${brandList.brand_name}</option>
							</c:forEach>
						</select>

						<label>상품명</label>
						<input class="form-control" type="text" placeholder="상품명을 입력해 주세요" style="disply: inline-block;">
					
						
					<div>
						<button  class="form-control btn btn-md btn-info">검색</button>
					</div>
			</div>
		</div><!--/.row-->


		
		<div class="row">
			<div class="col-lg-12 ">
				<div class="panel-heading"></div>
				<table  class="table table-hover panel-body">
					<thead>
						<tr>
							<th align="center" width="100">상품 번호</th>
							<th align="center" width="100">삼품명</th>
							<th align="center" width="100">카테고리</th>
							<th align="center" width="100">브랜드</th>
							<th align="center" width="100">할인적용</th>
							<th align="center" width="200">상품가격/할인가격</th>
							<th align="center" width="160">등록일</th>
							<th align="center" width="100">재고수</th>
							<th align="center" width="100">판매수</th>
						</tr>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty productList}">
								<tr>
									<td colspan="9">
										등록된 상품이 없습니다.
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${productList}" var="productList">
									<tr>
										<td align="center">${productList.product_no}</td>
										<td align="center">${productList.product_name}</td>
										<td align="center">${productList.product_category}</td>
										<td align="center">${productList.brand_name}</td>
										<td align="center"><input type="checkbox"></td>
										<td align="center">${productList.product_price}/
										 					할인가격</td>
										<td align="center">${productList.product_regDate}</td>
										<td align="center">${productList.product_stock}</td>						
										<td align="center">판매수</td>
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
				<p>이벤트 할인적용</p>
				<div class="col-lg-4">
					<select  class="form-control">
						<option>이벤트 선택</option>
							<c:forEach  items="${eventList}" var="eventList">
								<option>${eventList.event_name}</option>
							</c:forEach>
					</select>				
				</div>	
				
				<input type="button" class="btn btn-md btn-info" value="적용">
				<input type="button" class="btn btn-md btn-default" value="미적용"> 
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
	<form id='pagingForm' action="/admin/productList" method="get">
	<input type="hidden" name="product" value="${product}">
	   	<input type="hidden" name='pageNum' value='${page.pageNum}'>
	   	<input type="hidden" name='amount' value='${page.amount}'>
   </form>				
		
		

	</div>	<!--/.main-->


</body>
</html>