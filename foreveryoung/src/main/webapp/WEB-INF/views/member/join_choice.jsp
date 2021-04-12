<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

<style type="text/css">


</style>
<script type="text/javascript">
$(function(){

	$(".goback-btn").click(function(){
        history.go(-1);
	});
	
	$(".gohome-btn").click(function(){
        location.href = '/main';
	});
	
});

</script>
</head>
<body>
<jsp:include page="../template/header.jsp"></jsp:include>

<div>
	<a href="/member/join"><button class="inquiryGobtn">일반 회원가입</button></a>
	<a href="/member/join_brand"><button class="inquiryGobtn">판매자 회원가입</button></a>
</div>
<div>
	<button class="goback-btn">뒤로 가기</button>
	<button class="gohome-btn">홈으로 가기</button>
</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>