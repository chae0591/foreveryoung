<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 사이드 매뉴 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">

<!-- Common Design Link -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">

<!--  DatePicker-->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- 부트스트랩 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/css/bootstrap.css">

<title>판매상품 관리 페이지</title>
<style>
	nav, section {
		padding:10px;
		
	}


	section {
		width:1450px;
		float:right; 
	 
	}
	
	
	
	.menu a:hover {
	    background:#e9d319;
	    color: #000;
	}
	.menu a.active {
	    background:#e9d319;
	    color: #000;
	}

	.title{
		padding-top:30px; 
		padding-left:50px;
	}

	/* placeholder 색상  */
	input:-ms-input-placeholder {color: #a8a8a8; }
	input:-webkit-input-placeholder {color: #a8a8a8; }
	input:-moz-placeholder {color: #a8a8a8; }
	
	.searchBar{
		height:40px;
		width:400px;
		border: 1px solid #1b5ac2;
		background: #ffffff;
		
		margin:0 auto;
	}

	.searchInput{
		font-size: 16px;
		width:325px;
		padding:7px;
		border: 0px;
		outline: none;
		float:left; 
	}
	
	.searchButton{
		width:50px;
		height:100%;
		border: 0px;
		background: #1b5ac2;
		outline: none;
		float: right;
		color: #ffffff;
	}
	
	
	.calendarForm{
		display:flex; 
		flex-direction: row;
		
	   display: flex;
	  justify-content: center;	
	}
	
	.calendarInput{
		display: block;
	}
	
	.calendarLabel{
		display: block;
	}
	
	
	.productImg{
		width:150px;  
		height:100px;  
	}
	
	
	.search{
		display: inline-block; 
		margin:10px;
	}


.brand_page_banner {
	width: 850px;
	height: 350px;
	border: 1px solid black;
}
.brand_page_banner img {
	width: 800px;
	height: 280px;
}
.brand_page_banner p {
	max-width: 800px;
	max-height: 50px;
	font-size: 40px;
	font-weight: bold;
}
</style>

<script>
	$(document).ready(function(){
		var regex = new RegExp("(.*?)\.(jpg|jpeg|png)"); // 유진 수정
		var maxSize = 5242880; //5MB
		// 파일 확장자, 파일 크기 검사하는 함수
		function fileCheck(fileName, fileSize) {
			if(fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}
			
			if(!regex.test(fileName)) {
				alert("이미지 파일만 등록 가능합니다.");
				return false;
			}
			return true;
		}
		
		// 배너사진 선택 시
		$(".banner_edit").on("change", function(e) {
			if($(".upload").length) {
				console.log("삭제");
				var targetFile = $(".cancel_btn").data("file");

				$.ajax({
					url : '/bannerImgDel',
					data : {fileName:targetFile},
					dataType : 'text',
					type : 'POST',
					success : function(result) {
						alert(result);
						$(".upload").remove();
					}
				});
			}
			var formData = new FormData();
			
			var inputFile = $(".banner_edit");
			var files = inputFile[0].files;
			console.log(files.length);
			// fileCheck 함수로 업로드 된 이미지 검사
			for(var i = 0; i < files.length; i++) {
				if(!fileCheck(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("imgFile", files[i]);
			}

			$.ajax({
				url : '/bannerImg',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadedFile(result);
					}
			}); 
		});
		
		// 등록한 이미지 보여주기
		function showUploadedFile(result) {
			var str = "";
			var fileCallPath = encodeURIComponent(result.image_save_name);
			var originPath = "/" + result.image_save_name;
			console.log(fileCallPath);
			console.log(originPath);
			$("#banner_img").attr("src", "/bannerImgCk?fileName=" + fileCallPath + "");
			$(".cancel_btn").data("file", fileCallPath);
			$(".cancel_btn").data("type", "image");
			str += "<input type='hidden' class='upload' name='ban_img.image_name' value='"+result.image_name+"'>";
			str += "<input type='hidden' class='upload' name='ban_img.image_save_name' value='"+result.image_save_name + "'>";
			str += "<input type='hidden' class='upload' name='ban_img.file_type' value='"+result.file_type + "'>";
			str += "<input type='hidden' class='upload' name='ban_img.file_size' value='"+result.file_size + "'>";
			/* str += "<input type='hidden' "
				+ "data-image_save_name='" + obj.image_save_name + "' data-image_name='" + obj.image_name + "' data-file_type='" + obj.file_type + "' data-file_size='" + obj.file_size + "'>"
			 	+ "<button type='button' class='cancel_btn' data-file=\'"+ fileCallPath + "\' data-type='image'>삭제</button></div></li>"; */
			$("#action_form").append(str);
		}
		
		
		// 취소버튼 클릭 시
		$(".cancel_btn").on("click", function(e) {
			var targetFile = $(this).data("file");

			$.ajax({
				url : '/bannerImgDel',
				data : {fileName:targetFile},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
					$(".edit_btn").find("input[type='hidden']").remove();
				}
			});
		});
		
		$(".text_edit").on("input", function(e) {
			$("p").text($(this).val());
		});
		
		$(".edit_btn").on("click", function(e) {
			var fileName = $("input[name='file_name']").val();
					
			$.ajax({
				url : '/bannerImgDel',
				data : {fileName:fileName},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
				}
				
			});
			$(this).submit();
		});
	
	});
	
</script>
</head>
<body>
	<!-- <div id="left"> -->
		<!-- Sidebar/menu -->
		<nav class="menu w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
		  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
		  <div class="w3-container">
		    <h3 class="w3-padding-64"><b>포에버영<br>판메자 페이지</b></h3>
		  </div>
		  
		  <div class="w3-bar-block">
		    <a href="mypage_brand_main" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매자 메인</a> 
		    <a href="mypage_brand_buyer" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">구매자 관리</a> 
		    <a href="mypage_brand_product" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매 상품관리</a> 
		    <a href="mypage_brand_order" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">주문 관리</a> 
		    <a href="mypage_brand_chart" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">통계</a>
		    <a href="banner_page" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">브랜드관 관리</a> 
		  </div>
		</nav>

<section>
	<div class="center title">
		<h2> <c:out value="${brand_info.brand_name}" />님의 판매상품 관리 페이지</h2>
	</div>
	
	
	
	<div class="brand_page" style="margin-left: 40px;">
	<h3>미리보기</h3>
		<div class="brand_page_banner">
			<img alt="banner" src="/bannerImgCk?fileName=${banner.ban_img.image_save_name}" id="banner_img">
			<p><c:out value="${banner.text}" /></p>
			<input type="hidden" name="file_name" value="${banner.ban_img.image_save_name}">
		</div>
		<form id="action_form" action="banner_page" method="post">
			설명 : <input type="text" name="text" class="text_edit" value="<c:out value='${banner.text}'/>">
			배너 : <input type="file" class="banner_edit">
			<input type="hidden" name="ban_no" value="${banner.ban_no}">
			<button type="button" class="cancel_btn">취소</button>
			<button type="submit" class="edit_btn">수정완료</button>
		</form>
	</div>
</section>
		
<!--  부트스트랩을 사용하기위한 js설정 입력 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/bootstrap.js"></script>
</body>
</html>