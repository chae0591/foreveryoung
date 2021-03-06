<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/member/css/bootstrap.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="${pageContext.request.contextPath}/css/member/js/bootstrap.js"></script>
<script>
$(document).ready(function () {
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
    })
});
</script>
</head>
<body>
<header>
<jsp:include page="../template/header.jsp"></jsp:include>
</header>
<section>
<div class="container">
	<div class="row">
		<jsp:include page="mypagetemplate/mypagemenu.jsp"></jsp:include>
		<div class="col-md-8">
			<h2>배송지 추가</h2>
			<form action="addressAdd" method="post">
				<div class="outbox" style="width: 500px">
					<input type="hidden" name="address_customer" value="${check}">
					<div class="form-row">
						<label>배송지명</label>
						<input class="input form-control" type="text" name="address_name" required>
					</div>
					<hr>
					<div class="form-row">
						<label>배송지 주소</label>
						<input class="form-control" type="text" id="postcode" name="address_zonecode" placeholder="우편번호" required>
						<input type="button" id="postcode-btn" value="우편번호 찾기"><br>
						<input class="form-control" type="text" id="roadAddress" name="address_roadname" placeholder="도로명주소">
						<input class="form-control" type="text" id="jibunAddress" name="address_jibun" placeholder="지번주소">
						<span id="guide" style="color:#999;display:none"></span>
						<input class="form-control" type="text" id="detailAddress" name="address_detail" placeholder="상세주소" required>
						<input class="form-control" type="text" id="extraAddress" placeholder="참고항목">
					</div>
					<hr>
					<div class="form-row">
						<label>연락처</label>
						<input class="input form-control" type="text" name="address_phone">
					</div>
					<input class="input btn btn-primary" type="submit" value="저장">
				</div>
			</form>
		</div>
	</div>
</div>
</section>
<footer>
<jsp:include page="../template/footer.jsp"></jsp:include>
</footer>
</body>
</html>