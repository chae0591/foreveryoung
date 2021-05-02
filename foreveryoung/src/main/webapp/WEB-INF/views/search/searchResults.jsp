<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>

<style type="text/css">
hr {
	width: 1020px;
	text-align: center;
	margin: 0 auto;
}
.index_01 {
	width: 1020px;
	height: auto;
	text-align: center;
	margin: 0 auto;
	position: relative;
	overflow:hidden;
	display: block;
}
.index_01 > .index_slide {
	width: 100%;
	overflow: hidden;
	height: auto;
	position: relative;
	margin: 0 auto;
	text-align: center;
}
.index_slide > ul > li{
	display: inline-block;
	height: auto;
}

.index_title {
   padding-top: 20px;
   padding-bottom: 20px;
   color: #222;
}
.index_btn {
	width: 1020px;
	height: auto;
	margin: o auto;
	position:relative;
	text-align:center;
	margin-top: 30px;
	margin-bottom: 30px;
	 display:inline-block;
}

.index_btn button {
	width: 100px;
	height: 30px;
	border-radius: 5px;
    border:none;
    display:inline-block;
    background:#555;
    font-size:15;
    cursor:pointer;
    color: white;
    text-align:center;
    margin: o auto;
}
/* 상품 리스트 */
.pList1, .pList2, .pList3 {
	display: inline-block;
	list-style: none;
	width: 1020px;
}
.pList1 > li:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}
.pList2 > li:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}
.pList3 > li:hover{
	text-decotation:none;
	background-color: #E1F6FA;
}

.pList1 a {
	margin: 1rem auto;
}
.pList2 a {
	margin: 1rem auto;
}
.pList3 a {
	margin: 1rem auto;
}

.pList1 a > label{
	display:inline-block;
	width: 200px;
	text-decoration:none;
	font-size:15px;
	height:20px;
	padding-left: 5px;
	padding-right: 5px;
}
.pList2 a > label{
	display:inline-block;
	width: 200px;
	text-decoration:none;
	font-size:15px;
	height:20px;
	padding-left: 5px;
	padding-right: 5px;
}
.pList3 a > label{
	display:inline-block;
	width: 200px;
	text-decoration:none;
	font-size:15px;
	height:20px;
	padding-left: 5px;
	padding-right: 5px;
}
.price {
	color: #FF4646;
	font-size: 20px;
	text-align: center;
	margin-top : 1rem;
}

.brand {
	color : #50B4F5;
	text-align: center;
}

.detail > img {
	display: inline-block;
	width:170px;
	height:170px;
}

.pList1 li {
	display: inline-block;
    padding: 10px;
    margin : 10px;
    cursor: pointer;
    position: relative;
    width : 190px;
    height: 300px;
}
.pList2 li {
	display: inline-block;
    padding: 10px;
    margin : 10px;
    cursor: pointer;
    position: relative;
    width : 190px;
    height: 300px;
}

.pList3 li {
	display: inline-block;
    padding: 10px;
    margin : 10px;
    cursor: pointer;
    position: relative;
    width : 190px;
    height: 300px;
}


.vot_btn {
	position : absolute;
	top:135px;
	left:135px;
	background-color:white;
}

.vot_btn > img {
	width:45px;
	heigth:45px;
}
.order {
	margin: 40px;
	position: absolute;
	width: 1000px;
	top: -50px;
	left: 650px;
}
.order li{
	display:inline-block;
	list-style: none;
	float:left;
	padding: 10px 20px;
}
.order li > .active {
	color: black;
	font-weight: bold;
}
.Noindex_slide {
	width:100%;
	height: 400px;
}
.Noindex_slide ul {
	width: 100%;
	height: 100%;
}
.Noindex_slide ul > .img-cover {
	 background: url( "/resources/img/no_inquiry.png" ) no-repeat center 100px;
	 background-size: 150px 150px;
	 width: 100%;
     height: 100%;
     text-align: center;
     color: #888;
     font-size: 16px;
     text-align: center;
     line-height: 20px;
     padding-top: 280px;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	
	$(".more_btn").click(function(){
		location.href="/product/categoryList?category=skincare";
	});

	var user_num = $("input[name='user_num']").val();
	if(user_num != "") {
		voteCheck();
	}
	
	function voteCheck() {
		if(user_num == "") {
			return false;
		} else {
		$.ajax({
			url : '/vote/selectVote',
			type: 'GET',
			data: {'user_num' : user_num},
			success : function(result) {
				var num = 0;
				for(var i in result) {
					var i = result[i];
					$("[data-no="+i+"]").find("#vote_img").attr("src", "/img/product/like.png");
					$("[data-no="+i+"]").attr("value", "true");
				}
			}
		});// ajax
		}
	} //end votecheck
	
	// 좋아요
	$(document).on('click', '.vot_btn', function(){
		var target = $(this);
		var user_num = $("input[name='user_num']").val();
		var product_no = $(this).data("no");
		if(user_num == null || user_num == "") {
			location.href="/member/login";
			return false;
		}
		
		var url;
		if($(this).attr("value") == "true") {
			url = "/vote/deleteVote";
		} else if ($(this).attr("value") == "false") {
			url = "/vote/insertVote";
		}
		
		$.ajax({
			url : url,
			data : {'user_num':user_num, 'product_no':product_no},
			type: 'POST',
			success : function(result) {
				$(target).attr("value", result);
				if(result == "true") {
					$(target).find(".like").attr("src", "/img/product/like.png");
					$("[data-no="+product_no+"]").find("#vote_img").attr("src", "/img/product/like.png");
					$("[data-no="+product_no+"]").attr("value", "true");
				} else {
					$(target).find(".like").attr("src", "/img/product/unlike.png");
					$("[data-no="+product_no+"]").find("#vote_img").attr("src", "/img/product/unlike.png");
					$("[data-no="+product_no+"]").attr("value", "false");
				}
				
				
				}
		}); // ajax
	}); // end 좋아요
});
</script>

</head>
<body>

<jsp:include page="../template/header.jsp"></jsp:include>

<div class="index_01">
	<div class="index_header">
		<h2 class="index_title">검색 결과</h2>
	</div>

	<c:choose>
	<c:when test="${empty map.searchList}">
		<div class="Noindex_slide">
				<ul>
					<li class="img-cover">${map.keyword}에 맞는 결과가 없습니다</li>
				</ul>
		</div>
	</c:when>
	<c:otherwise>
	<div class="index_slide">
		<ul>
			<li class="slide1" >
				<ul class="pList1">
				<c:forEach var="searchList" items="${map.searchList}">
					<li>
						<input type="hidden" name="product_no" value="${searchList.product_no}">
						<a class="detail" href="${pageContext.request.contextPath}/detail_board/detail_main?product_no=${searchList.product_no}">
 							<img class="img-responsive" src="/viewImg?fileName=${searchList.image_save_name}&imageType=${searchList.image_type}">
 							<label class="brand"><c:out value="${searchList.brand_name}"/></label>
							<label><c:out value="${searchList.product_name}" /></label>
							<label class="price"><fmt:formatNumber value="${searchList.product_price}" pattern="###,###,###"/>원</label>
						</a>
							<button class="vot_btn" data-no="${searchList.product_no}" value="false">
								<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
							</button>
					</li>
				</c:forEach>
				</ul>
			</li>
		</ul>
	</div>
	<div class="index_btn">
		<button class="more_btn">더보기</button>
	</div>
		</c:otherwise>
		</c:choose>
</div>
	
<jsp:include page="../template/footer.jsp"></jsp:include>

</body>
</html>