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
	text-align: center;
	margin: 0 auto;
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

.event-title {
   padding-top: 20px;
   padding-bottom: 20px;
   color: #222;
}
.first-box a {
    color: #000;
    padding: 20px;
    ling-height: 44px;
    font-size: 16px;
    font-weight: 700;
    font-style: normal;
}
.category-box {
	width: 100%;
	height: 47px;
	border-top: 1px solid #dddddd;
	border-bottom: 1px solid #dddddd;
}
.category-box ul {
	float: left;
	text-align: center;
	margin: 0 auto;
    padding: 0;
    width: 100%;
}
.category-box li {
 	padding-top: 13px;
    display: inline-block;
    text-align:center;
    width: 14%;
    height: 100%;
    position: relative;
    float: left;
}
.category-box li a {
    padding: 20px;
    font-style: normal;
    font-size: 16px;
    line-height: 24px;
    font-weight: 600;
    letter-spacing: -.24px;
    color: #222;
}
.item-name{
    display: block;
    font-size: 14px;
    line-height: 20px;
    font-weight: 500;
    letter-spacing: -.21px;
    color: #222;
    display: -webkit-box;
    overflow: hidden;
    text-overflow: ellipsis;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    white-space: normal;
    cursor: pointer;
}
.item-explanation {
	display: block;
    font-size: 12px;
    line-height: 18px;
    font-weight: 100;
    letter-spacing: -.18px;
    color: #222;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
.item-price {
    display: inline-block;
    font-size: 14px;
    line-height: 20px;
    font-weight: 500;
    letter-spacing: -.21px;
    color: #222;
    vertical-align: middle;
}
.slide {
	height: 300px;
    min-width: 1020px;
    width: 100%;
    position: relative;
    background-color: #ffc948;
}
   .slide{height:300px;overflow:hidden;position:relative;}
    .slide li{position:absolute;left:0;right:0;top:0;bottom:0;opacity:0;transition:1s;}
    .slide li:nth-child(1){background:#ffa;}
    .slide li:nth-child(2){background:#faa;}
    .slide li:nth-child(3){background:#afa;}
    .slide li:nth-child(4){background:#aaf;}
    .slide input{display:none;}
    .slide .bullet{position:absolute;bottom:20px;left:0;right:0;text-align:center;z-index:10;}
    .slide .bullet label{
    width:15px;height:15px;
    border-radius:10px;
    border:none;display:inline-block;
    background:#fff;font-size:0;
    transition:0.5s;cursor:pointer;
    }
    /* 슬라이드 조작 */
    #pos1:checked ~ ul li:nth-child(1),
    #pos2:checked ~ ul li:nth-child(2),
    #pos3:checked ~ ul li:nth-child(3),
    #pos4:checked ~ ul li:nth-child(4){opacity:1;}
    /* bullet 조작 */
    #pos1:checked ~ .bullet label:nth-child(1),
    #pos2:checked ~ .bullet label:nth-child(2),
    #pos3:checked ~ .bullet label:nth-child(3),
    #pos4:checked ~ .bullet label:nth-child(4){background:#666;}
    
.more-btn {
	width: 100px;
	heigh: 50px;
}
</style>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>

<div class="slide">
  	<input type="radio" name="pos" id="pos1" checked>
    <input type="radio" name="pos" id="pos2">
    <input type="radio" name="pos" id="pos3">
    <input type="radio" name="pos" id="pos4">
    <ul>
      <li></li>
      <li></li>
      <li></li>
      <li></li>
    </ul>
    <p class="bullet">
      <label for="pos1">1</label>
      <label for="pos2">2</label>
      <label for="pos3">3</label>
      <label for="pos4">4</label>
    </p>
</div>

<div class="first-box">
	<h2 class="event-title">이 상품 어때요?</h2>
	<table>
		<tr>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p class="item-name">제품명</p>
				<p class="item-explanation">제품설명</p>
				<p class="item-price">0,000원</p>
				</a>
			</td>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p class="item-name">제품명</p>
				<p class="item-explanation">제품설명</p>
				<p class="item-price">0,000원</p>
				</a>
			</td>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p class="item-name">제품명</p>
				<p class="item-explanation">제품설명</p>
				<p class="item-price">0,000원</p>
				</a>
			</td>
			<td>
				<a href="#">
				<img src="https://placeimg.com/200/200/people">
				<p class="item-name">제품명</p>
				<p class="item-explanation">제품설명</p>
				<p class="item-price">0,000원</p>
				</a>
			</td>
		</tr>
	</table>
	
	<button class="more-btn">더보기</button>
	
</div>

<hr>

<div class="second-box">
	<h2 class="event-title">이번주 BEST</h2>
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
	<button class="more-btn">더보기</button>
	
</div>

<hr>

<div class="third-box">
	<h2 class="event-title">주목해야 할 신상</h2>
	<button class="more-btn">더보기</button>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>

</body>
</html>