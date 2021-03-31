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
	width: 1020px;
	height: 500px;
	text-align: center;
	margin: 0 auto;
}

.second-box {
	width: 1020px;
	height: 500px;
	text-align: center;
	margin: 0 auto;
}

.third-box {
	width: 1020px;
	height: 500px;
	text-align: center;
	margin: 0 auto;
}
table {
	width: 1020px;
	margin: 0;
	padding: 0;
}

.first-box a {
    color: #000;
    padding: 20px;
    text-decoration: none;
    ling-height: 44px;
    font-size: 16px;
    font-weight: 700;
}
.category-box {
	width: 100%;
	height: 47px;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
}
.category-box ul {
	float: left;
	text-align:center;
    list-style-type: none;
    margin: 0;
    padding: 0;
    width: 100%;
}
.category-box li {
 	padding-top: 13px;
    display: inline-block;
    text-align:center;
}
.category-box li a {
    color: #000;
    padding: 20px;
    text-decoration: none;
    ling-height: 44px;
    font-size: 16px;
    font-weight: 700;
}

</style>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
	
<div class="first-box">
	<h2>이 상품 어때요?</h2>
	<table>
		<tr>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p>제품명</p>
				<p>제품설명</p>
				<p>0,000원</p>
				</a>
			</td>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p>제품명</p>
				<p>제품설명</p>
				<p>0,000원</p>
				</a>
			</td>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p>제품명</p>
				<p>제품설명</p>
				<p>0,000원</p>
				</a>
			</td>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p>제품명</p>
				<p>제품설명</p>
				<p>0,000원</p>
				</a>
			</td>
		</tr>
	</table>
	<button>더보기</button>
</div>

<hr>

<div class="second-box">
	<h2>이번주 BEST</h2>
	<div class="category-box">
	<ul>
		<li><a href="#">전체</a></li>
		<li><a href="#">스킨케어</a></li>
		<li><a href="#">메이크업</a></li>
		<li><a href="#">바디케어</a></li>
		<li><a href="#">헤어케어</a></li>
		<li><a href="#">향수/디퓨저</a></li>
		<li><a href="#">남성케어</a></li>
	</ul>
	</div>
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