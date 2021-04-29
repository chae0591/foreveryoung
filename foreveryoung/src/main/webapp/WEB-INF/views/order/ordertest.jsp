<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/common.css">
<style>
.pro-img{
	height: 50px;
	width: 50px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
$(document).ready(function(){
	var formObj = $("#order-form");
	
	$("#test").click(function(){
		console.log("테스트");
		
		var IMP = window.IMP;
		IMP.init('imp66465553');

		IMP.request_pay({
		pg: 'inicis',
		pay_method: 'card',
		merchant_uid: 'merchant_' + new Date().getTime(),
		
		name: '주문명:결제테스트',

		amount: $("#finalpayment").val(),

		buyer_email: '',
		buyer_name: $("#customer_name").val(),
		buyer_tel: $("#customer_phone").val(),
		buyer_addr: $("input[name=address_roadname]").val() + $("input[name=address_detail]").val(),
		m_redirect_url: '/member/mypage'
		
		}, function (rsp) {
		console.log(rsp);
		if (rsp.success) {
		var msg = '결제가 완료되었습니다.';
		msg += '고유ID : ' + rsp.imp_uid;
		msg += '상점 거래ID : ' + rsp.merchant_uid;
		msg += '결제 금액 : ' + rsp.paid_amount;
		msg += '카드 승인번호 : ' + rsp.apply_num;
		
		formObj.submit();
		
		} else {
		var msg = '결제에 실패하였습니다.';
		msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
		});
	});
	
	$("#postcode-btn").click(function() {
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }

                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                document.getElementById('postcode').value = data.zonecode;
                document.getElementById("roadAddress").value = roadAddr;
                document.getElementById("jibunAddress").value = data.jibunAddress;
                
                if(roadAddr !== ''){
                    document.getElementById("extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");

                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    });
});
</script>
</head>
<body>
<header>
<jsp:include page="../template/header.jsp"></jsp:include>
</header>
	
	<div class="outbox" style="width: 500px">
	<h2>주문 결제</h2>
	<form id="order-form" action="ordertest_payment" method="post">
		<fieldset>
		<div class="row">주문자 정보 </div>
		<div class="row">아이디 : 
			<input class="input" type="text" value="${customerInfo.user_id}" readonly required>
		</div>
		<div class="row">이름 : 
			<input class="input" type="text" id="customer_name" value="${customerInfo.user_name}" readonly>
		</div>
		<div class="row">연락처 : 
			<input class="input" type="text" id="customer_phone" value="${customerInfo.user_phone}" readonly required>
		</div>
		</fieldset>
		<br>
		<hr>
		
		<div class="row">배송지 정보</div>
		<div class="row">
		<fieldset>
			<div class="row">
				배송지명 : <input class="input" type="text" name="address_name" value="${addressInfo.address_name}">
			</div>
			<div class="row">
				<input type="text" id="postcode" placeholder="우편번호" name="address_zonecode" value="${addressInfo.address_zonecode}" required>
				<input type="button" id="postcode-btn" value="우편번호 찾기"><br>
				<input type="text" id="roadAddress" placeholder="도로명주소" name="address_roadname" value="${addressInfo.address_roadname}">
				<input type="text" id="jibunAddress" placeholder="지번주소" name="address_jibun" value="${addressInfo.address_jibun}">
				<span id="guide" style="color:#999;display:none"></span>
				<input type="text" id="detailAddress" placeholder="상세주소" name="address_detail" value="${addressInfo.address_detail}" required>
				<input type="text" id="extraAddress" placeholder="참고항목">
			</div>
			<div class="row">
				연락처 : <input class="input" type="text" name="address_phone" value="${addressInfo.address_phone}" required>
			</div>
		</fieldset>
		</div>
		<br>
		<hr>
		
		<div class="row">상품 정보</div>
		<c:set var="totaltemp" value="0"></c:set>
		<c:forEach var="product" items="${productInfo}">
		<div class="row">
		<fieldset>
			<legend>주문 상품 정보</legend>
			<c:choose>
				<c:when test="${empty product.image_save_name}">
					<img src="https://dummyimage.com/50x50/000/fff&text=foreveryoung">
				</c:when>
				<c:otherwise>
					<img class="pro-img img img-responsive" src="/viewImg?fileName=${product.image_save_name}&imageType=${product.image_type}">
				</c:otherwise>
			</c:choose>
			<input type="hidden" name="order_product" value="${product.product_no}">
			<input type="hidden" name="order_brand" value="${product.product_brand}">
			제품명 : <input class="input" type="text" value="${product.product_name}" readonly>
			카테고리 : <input class="input" type="text" value="${product.product_category}" readonly>
			가격 : <input class="input" type="text" value="${product.product_price}" readonly>
			수량 : <input class="input" type="text" name="order_amount" value="${product.cart_count}" readonly>
			합계 : <input class="input" type="text" name="order_totalPrice" value="${product.product_price*product.cart_count}" readonly>	
			<c:set var="totaltemp" value="${totaltemp+product.product_price*product.cart_count}"></c:set>
			<br>
		</fieldset>
		</div>
		</c:forEach>
		<div class="row">
			<fieldset>
			최종 결제 금액 : <input class="input" id="finalpayment" type="text" value="${totaltemp}" readonly>			
			</fieldset>
		</div>
		<br>
		<hr>
		<div class="row"><input id="test" type="button" value="결제하기"></div>
		<!-- <input type="submit" value="입력"> -->
	</form>
	</div>
<footer>
<jsp:include page="../template/footer.jsp"></jsp:include>
</footer>
</body>
</html>