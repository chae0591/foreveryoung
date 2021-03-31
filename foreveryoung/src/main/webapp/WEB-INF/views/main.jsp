<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<style>
hr {
	width: 1020px;
}
.first-box {
	text-align: center;
}


.second-box {
	text-align: center;
}

.third-box {
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
	
<div class="first-box">
	<h2>이 상품 어때요?</h2>
	<button>더보기</button>
	<ul></ul>
	
</div>
<hr>
<div class="second-box">
	<h2>이번주 BEST</h2>
	<button>더보기</button>
</div>
<hr>
<div class="third-box">
	<h2>주목해야 할 신상</h2>
	<button>더보기</button>
</div>
<jsp:include page="template/footer.jsp"></jsp:include>

</body>
</html>