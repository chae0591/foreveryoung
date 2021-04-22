<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
$(document).ready(function () {
	$(".slide_a").click(function(){
		$(this).next("ol,ul").slideToggle();
	});
	
	$(".slide_a").click();
});
</script>
</head>
<body>
	<div class="col-md-2 col-lg-offset-2">
		<div class="leftmenu">
		<h3>마이페이지</h3>
			<ul class="leftmenu_list">
				<li>
					<a href="contractList">주문 내역</a>
		        </li>
		                
		        <li>
		        	<a href="cartList">장바구니</a>
		        </li>
		                
		        <li>
		        	<a href="my_vote">관심등록</a>
		        </li>
		                
		        <li>
			        <a class="slide_a">문의 내역</a>
			        <ul>
			        	<li><a href="my_inquiry">1 대 1 상담</a></li>
				        <li><a href="">상품 리뷰</a></li>
			        </ul>
		        </li>
		                
		        <li>
			        <a class="slide_a">내 설정</a>
			        <ul>
				        <li><a href="mypage_edit">회원 정보 변경</a></li>
				        <li><a href="addressList">주소록 보기</a></li>
			        </ul>
		        </li>
			</ul>
		</div>
	</div>
</body>
</html>