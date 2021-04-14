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
			<div class="col-lg-12">
				<p>통합검색</p>
					<label>카테고리</label>
					<select>
						<option>카테고리 선택</option>
					</select>
					
					<label>브랜드</label>
					<select>
						<option>브랜드 선택</option>
					</select>				
					
					<label>상품명</label>
					<input type="text" value="상품명을 입력해 주세요">
					<button >검색</button>
			
			
			</div>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<table  class="table table-hover">
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
										<td align="center">${productList.product_id}</td>
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
				<select>
					<option>이벤트 선택</option>
				</select>
				
				<input type="button" value="적용">
				<input type="button" value="미적용"> 
			</div>
		</div><!--/.row-->

	</div>	<!--/.main-->


</body>
</html>