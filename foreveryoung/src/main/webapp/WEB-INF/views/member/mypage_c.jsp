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
<script>

</script>
</head>
<body>
	<div class="outbox" style="width: 1000px; position: relative" >
		<div class="leftmenu">
		    <h3>마이페이지</h3>
			<ul class="leftmenu_list">
                <li>
                    <a href="">주문 내역</a>
                </li>
                
                <li>
                    <a href="">장바구니</a>
                </li>
                
                <li>
                    <a href="">관심등록</a>
                    <ul>
                        <li><a href="">관심 상품</a></li>
                        <li><a href="">관심 브랜드</a></li>
                    </ul>
                </li>
                
                <li>
                    <a href="">내가 쓴 글</a>
                    <ul>
                        <li><a href="">상품 리뷰</a></li>
                        <li><a href="">Q & A</a></li>
                        <li><a href="">1 대 1 상담</a></li>
                    </ul>
                </li>
                
                <li>
                    <a href="mypage_c_edit">내 설정</a>
                    <ul>
                        <li><a href="mypage_c_edit">회원 정보 변경</a></li>
                        <li><a href="">주소록 변경</a></li>
                    </ul>
                </li>
			</ul>
		</div>
		<div class="contentbox">
			<div class="row">
				<h5>번호 : <c:out value="${check}"></c:out></h5>
				<h5>권한 : <c:out value="${auth}"></c:out></h5>
				<h5>고객 정보 : <c:out value="${user_info}"></c:out></h5>
				<h5>이름 : <c:out value="${user_info.user_name}"></c:out></h5>
			</div>
			<div class="row">
				<h2>주문 / 배송 조회</h2>
				<table>
					<tbody>
						<tr>
							<th>결제</th>
							<th>배송진행</th>
							<th>배송완료</th>
							<th>주문취소</th>
							<th>반품/교환</tr>
						<tr>
						<tr>
							<td>0</td>
							<td>1</td>
							<td>0</td>
							<td>0</td>
							<td>0</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="row">
				<h2>최근 주문내역</h2>
				<table>
					<tbody>
						<tr>
							<th>날짜</th>
							<th style="width: 70%">상품 정보</th>
							<th>상태</th>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="row">
				<h2>상담 신청내역</h2>
				<table>
					<tbody>
						<tr>
							<th>날짜</th>
							<th style="width: 70%">제목</th>
							<th>상태</th>
						</tr>
						<tr>
							<td></td>
							<td></td>
							<td></td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="row">
				<div>배송지</div>
				<div>이메일</div>
				<div>전화번호</div>
			</div>
		</div>
	</div>
</body>
</html>			