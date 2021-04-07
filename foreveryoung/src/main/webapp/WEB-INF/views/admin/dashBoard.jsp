<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){
		$("#inquiry_list").click(function(){
			self.location = "/admin/inquiryList"
		})
		$("#report_list").click(function(){
			//self.location = "/admin/reportList"
		})
		
	})

</script> 


</head>
<body>
	<h1>대시보드</h1>
	
	
	<div>
		<h2>전체 현황</h2>
		<table border="1">
			<tr>
				<th align="center">회원 수</th>
				<th align="center">브랜드 수</th>
				<th align="center">상품 수</th>
			</tr>
			<tr>
				<td align="center">
					<a href="/admin/customerList">
						아직임
						<c:out value="${customerCount}"></c:out><!-- 안나옴... -->
					</a>
				</td>
				<td align="center">
					<a href="/admin/brandList">아직임</a>
				</td>
				<td align="center">
					<a href="/admin/productList">아직임</a>
				</td>
			</tr>
			
		</table>
		
	</div>
	
	<div>
		<h2>주문처리 현황</h2>
		
		<table border="1">
			<tr>
				<th align="center">입금 대기</th>
				<th align="center">입금 완료</th>
				<th align="center">배송 대기</th>
				<th align="center">배송 대기</th>
				<th align="center">환불</th>
				
			</tr>
			<tr>
				<td align="center">아직</td>
				<td align="center">아직</td>
				<td align="center">아직</td>
				<td align="center">아직</td>
				<td align="center">아직</td>

			</tr>
			
		</table>
	</div>
	
	
	<div>
		<h2>클레임 현황</h2>
		
		<button id="inquiry_list">1:1문의</button>
		<button id="report_list">상품 리뷰 신고</button>
		
		
		
	</div>
	
	
</body>
</html>