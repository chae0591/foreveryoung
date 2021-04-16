<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/mypage.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<div class="outbox">
		<div>검색부 넣을 부분
			<div>
				<button>1주일</button>
				<button>15일</button>
				<button>1개월</button>
			</div>
			
			<div>
				<button>3월</button>
				<button>2월</button>
				<button>1월</button>
			</div>
			
			<div>
				<input type="date"> ~ <input type="date">
			</div>
			<div><button>조회하기</button></div>
		</div>
		
		<c:out value="${order_info}"></c:out>
		<c:out value="${product_info}"></c:out>
		<table>
			<tbody>
				<tr>
					<th>날짜</th>
					<th>상품정보</th>
					<th>상태</th>
					<th>확인신청</th>
				</tr>
				<c:choose>
					<c:when test="${empty order_info}">
						주문 내역이 없습니다.
					</c:when>
					<c:otherwise>
						<tr>
							<td>날짜 내용</td>
							<td>상품 정보 내용</td>
							<td>상태내용</td>
							<td>확인신청 버튼</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td><input type="text"><button>검색</button></td>
				</tr> 
			</tfoot>
		</table>
	</div>
</body>
</html>