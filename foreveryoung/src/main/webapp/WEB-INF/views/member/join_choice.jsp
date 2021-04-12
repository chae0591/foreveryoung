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
.choice-btns {
	width: 100%;
	min-width: 1020px;
	heigth: auto;
	margin: 0 auto;
	margin-top: 80px;
	margin-bottom: 50px;
	text-align: center;
}
.choice-btns hr {
	width: 1020px;
	margin: 0 auto;
	text-align: center;
	margin-top: 50px;
	margin-bottom: 50px;
}
.title-box1 {
	width: 100%;
	margin: 0 auto;
	margin-bottom: 40px;
}
.title-box2 {
	width: 100%;
	margin: 0 auto;
	margin-bottom: 20px;
}
.title1 {
	text-align: center;
	font-size: 50px;
	position: relative;
	margin-bottom: 20px;
}
.title2 {
	text-align: center;
	font-size: 16px;
	position: relative;
}
.title3 {
	text-align: center;
	font-size: 16px;
	position: relative;
}
.memberJoin {
	margin-left: 10px;
	margin-right: 10px;
	width: 450px;
	height: 60px;
	border-radius: 10px;
	font-size: 25px;
	font-weight: 500;
	background-color: #555;
	color: #fff;
}
.brandJoin {
	margin-left: 10px;
	margin-right: 10px;
	width: 450px;
	height: 60px;
	border-radius: 10px;
	font-size: 25px;
	font-weight: 500;
	background-color: #555;
	color: #fff;
}
.move-btns {
	width: 1020px;
	heigth: auto;
	margin: 0 auto;
	text-align: center;
	margin-bottom: 80px;
}
.goback-btn {
	margin-left: 10px;
	margin-right: 10px;
	width: 100px;
	height: 30px;
	border-radius: 5px;
	font-size: 15px;
	font-weight: 500;
	background-color: #dddddd;
	color: #555;
}
.gohome-btn {
	margin-left: 10px;
	margin-right: 10px;
	width: 100px;
	height: 30px;
	border-radius: 5px;
	font-size: 15px;
	font-weight: 500;
	background-color: #dddddd;
	color: #555;
}
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

<div class="choice-btns">
	<div class="title-box1">
		<p class="title1">포레버영 회원가입</p>
		<p class="title2">Let's enjoy shopping in a trendy way!</p>
	</div>
	<hr>
	<div class="title-box2">
		<p class="title3">일반/판매자 유형을 선택해주세요.</p>
	</div>
	<a href="/member/join"><button class="memberJoin">일반 회원가입</button></a>
	<a href="/member/join_brand"><button class="brandJoin">판매자 회원가입</button></a>
	<hr>
</div>

<div class="move-btns">
	<button class="goback-btn">뒤로 가기</button>
	<button class="gohome-btn">홈으로 가기</button>
</div>

<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>