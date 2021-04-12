<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../template/header.jsp"></jsp:include>
<title>상품 등록 페이지</title>

<!--  부트스트랩 css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/css/bootstrap.css">
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.5/validator.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="http://cdn.jsdelivr.net/jquery.validation/1.15.0/jquery.validate.min.js"></script> -->

</head>
<style>
	.uploadResult ul {
		display:flex;
		flex-flow: row;
		justify-center : center;
		align-items : center;
	}
	
	.uploadResult ul li {
		list-style:none;
		padding:10px;
	}
	
	.uploadReulst ul li img {
		width:20px;
	}
	
	
		/* set font bold */
	.bold 
	{
		font-weight:bold; 
	}
	
	/* filedset center */
	fieldset{
	    border: solid 1px #DDD !important;
	     padding: 0 10px 10px 10px;
	    border-bottom: none;
	    width: 800px;
      margin:auto;
	    
	}
	

	legend{
	    width: auto !important;
	    border: none;
	    font-size: 20px;
	    
	    
	}
	
	.category {
		margin:auto; 
	}
	
	.checkboxes {
      text-align:center;
     }

    .checkboxes input{
      margin: 0px 0px 0px 0px;
     }

     .checkboxes label{
       margin: 0px 20px 0px 3px;
     }
	
	.form-group.required .control-label:after { /* 필수항목 마크 */
	   content:"*";
	   color:red;
	}
		
	
	
</style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script>
	// 등록된 이미지 클릭 시 새창으로 이미지 열기
	function showImage(fileCallPath, imageType) {
		window.open("/viewImg?fileName=" + fileCallPath + "&imageType="+imageType, "image", "width=700px, height=600px");
	}
	
	$(document).ready(function(){
		
		
			
		// 이미지 파일만 업로드할 수 있게 처리
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

		
		// 썸네일이미지
		$("#upload_file").on("change", function(e){
			var formData = new FormData();
			
			var inputFile = $("#upload_file");
			var files = inputFile[0].files;
			
			// fileCheck 함수로 업로드 된 이미지 검사
			for(var i = 0; i < files.length; i++) {
				if(!fileCheck(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			formData.append("image_type", "N");
			
			$.ajax({
				url : '/productImg',
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
			
		});// upload_file
		
		// 상세보기이미지
		$("#upload_file_detail").on("change", function(e){
			var formData = new FormData();

			var inputFile = $("#upload_file_detail");
			var files = inputFile[0].files;
			
			// fileCheck 함수로 업로드 된 이미지 검사
			for(var i = 0; i < files.length; i++) {
				if(!fileCheck(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			formData.append("image_type", "D");
			
			$.ajax({
				url : '/productImg',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadedFile(result);
					}
		}); // ajax
		});// upload_file_detail
		
		// 상품이미지
		$("#upload_file_product").on("change", function(e){
			var formData = new FormData();

			var inputFile = $("#upload_file_product");
			var files = inputFile[0].files;
			
			// fileCheck 함수로 업로드 된 이미지 검사
			for(var i = 0; i < files.length; i++) {
				if(!fileCheck(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			formData.append("image_type", "P");
			
			$.ajax({
				url : '/productImg',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						showUploadedFile(result);
					}
		}); // ajax
		});// upload_file_product
		
		// 태그 변수 생성
		var uploadResult = $(".uploadResult ul");
		
		// ul 태그에 파일 정보 담긴 li append
		function showUploadedFile(uploadResultArr) {
			var str = "";
			
			$(uploadResultArr).each(function(i, obj){
					var fileCallPath = encodeURIComponent("s_" + obj.image_save_name);
					var originPath = "/" + obj.image_save_name;
					console.log(fileCallPath);
					console.log(originPath);
					str += "<li data-image_save_name='" + obj.image_save_name + "' data-image_name='" + obj.image_name + "' data-file_type='" + obj.file_type + "' data-file_size='" + obj.file_size + "' data-image_type='" + obj.image_type + "'><div>"
						+ "<span> " + obj.image_name + "</span>"
					 	+ "<a href=\"javascript:showImage(\'" + originPath + "\', \'" + obj.image_type + "\')\"><img src='/viewImg?fileName=" + fileCallPath + "&imageType="+obj.image_type + "'></a>"
					 	+ "<button type='button' data-file=\'"+ fileCallPath + "\' data-type='image' data-image_type='" + obj.image_type + "'>삭제</button></div></li>";
			});
			uploadResult.append(str);
		}
		
		
		// 삭제 버튼
		$(".uploadResult").on("click","button", function(e){
			var fileTag = "";
			// li 에 생성했던 data-*** 변수에 담기
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			var imageType = $(this).data("image_type");
			
			if(imageType == "N") {
				fileTag = $("#upload_file");
			} else if(imageType == "D") {
				fileTag = $("#upload_file_detail");
			} else if(imageType == "P") {
				fileTag = $("#upload_file_product");
			}
			
			$.ajax({
				url : '/deleteImg',
				data : {fileName:targetFile, type:type, imageType:imageType},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
					
					targetLi.remove();
					fileTag.val("");
				}
			});
		});
		
		// 파일삭제 또는 main 페이지 이동 처리
		function deleteImgLocation() {
			if($(".uploadResult ul li").length) {
				deleteImg();
			} else {
				window.location.href="/main";
			}
		};
		
		// 취소버튼 클릭 시 파일 delete
		$(".cancelBtn").on("click", function(e){
			deleteImgLocation();
		});
		
		
		// 폴더 내 이미지 삭제 필요 시 호출되는 함수
		function deleteImg() {
			var targetFile = $(".uploadResult ul li button").data("file");
			var type = $(".uploadResult ul li button").data("type");
			var imageType = $(".uploadResult ul li button").data("image_type");
			var targetLi = $(".uploadResult ul li button").closest("li");
			console.log(targetFile);
			$.ajax({
				url : '/deleteImg',
				data : {fileName:targetFile, type:type, imageType:imageType},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
							alert(result);
							targetLi.remove();
							// main 페이지로 이동
							location.href="/main";		
						}
				})
		}
		
		// 상품 등록하지 않고 새로고침, 뒤로가기 등 페이지 이동 발생 시 폴더 내 이미지 삭제 
		$(window).on("beforeunload", function(){
			deleteImgLocation();
		});
		// 단, submit 시에는 위 작업이 수행되지 않고 submit 이 된다.
		$(document).on("submit", "form", function(){
			$(window).off('beforeunload');
		});
		
		
		var formObj = $("form");
		
		$("#trigger").on("click", function(e){
			// form submit 시 실행
			console.log("파일등록");
			
			var str = "";
			
			if($(".uploadResult ul li").length) {
				console.log("이미지 입력");
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir(jobj);
					
					str += "<input type='hidden' name='uploadFileList["+i+"].image_name' value='"+jobj.data("image_name")+"'>";
					str += "<input type='hidden' name='uploadFileList["+i+"].image_save_name' value='"+jobj.data("image_save_name") + "'>";
					str += "<input type='hidden' name='uploadFileList["+i+"].file_type' value='"+jobj.data("file_type") + "'>";
					str += "<input type='hidden' name='uploadFileList["+i+"].file_size' value='"+jobj.data("file_size") + "'>";
					str += "<input type='hidden' name='uploadFileList["+i+"].image_type' value='"+jobj.data("image_type") + "'>";
					console.log(str);
				});
					$(this).append(str);
				}
		});
		
		$("#btn-submit").bind("click", function(e){
			$("#trigger").trigger("click");
		});
		
	});
	
</script>
<body>



	<!-- 시작 -->
		<div>	
			<h2 class="bold center">상품 등록 페이지</h2>
		</div>
	
	<br><br>
	<form  action="productWrite" method="post" class="form-group required"> <!-- 필수항목 마크  -->
		
					
		<fieldset>
			<legend class="bold" style="align:center font-size: 25px"> 필수 입력 항목</legend>
				
				<div class="form-check checkboxes">
					<p class="bold" style="align:left" >상품 카테고리</p> <!--control-label = 필수항목 마크  -->
					<input type="radio" class="form-check_input category" name="product_category" value="skincare" id="skincare" checked>
					<label class="form-check-label" for="skincare">스킨케어</label>
					
					<input type="radio" class="form-check_input category" name="product_category" value="makeup" id="makeup">
					<label class="form-check-label" for="makeup">메이크업</label>
					
					<input type="radio" class="form-check_input category" name="product_category" value="bodycare" id="bodycare">
					<label class="form-check-label" for="bodycare">바디케어</label>
					
					<input type="radio" class="form-check_input category" name="product_category" value="haircare" id="haircare">
					<label class="form-check-label" for="haircare">헤어케어</label>
					
					<input type="radio" class="form-check_input category" name="product_category" value="perfume" id="perfume">
					<label class="form-check-label" for="perfume">향수 / 디퓨져</label>
					
					<input type="radio" class="form-check_input category" name="product_category" value="manscare" id="manscare">
					<label class="form-check-label" for="manscare">남성케어</label>
				</div>	
			
			<hr>
		
			<div class="form-group">
				<label class="bold">상품 이름</label>
				<input class="form-control" type="text" name="product_name" placeholder="상품 이름을 입력하시오." required />
			</div>
			<br>
		
		
			<div>
				<label class="bold">상품 등록자(브랜드)</label> 
				<br>
				<select name="product_brand" required>
					<c:forEach var="brand" items="${brand}">
						<option value="${brand.brand_num}">${brand.brand_name}</option>
					</c:forEach>
				</select>
				<!-- <input class="form-control" type="text" name="product_brand" placeholder=" 판매자(브랜드)명이 들어감" required> -->
			</div>
			<br>
			
			<div>
				<label class="bold">상품 가격</label>
				<input class="form-control" type="text" name="product_price" required placeholder="상품 가격을 입력하시오. 숫자만" size="50">
			</div>
			<br>
			
			<div>
				<label class="bold">상품 재고</label>
				<input class="form-control" type="text" name="product_stock" required placeholder="삼품 재고 입력하시오." size="50">
			</div>
			<br>
						
			<div class="outbox">
				<div class="upload_img">
					<label style="font-weight:bold" class="control-label">상품 썸네일</label>
					<input type="file" name="upload_file" id="upload_file" required>
				</div>
				
				<br>
				
				<div class="upload_detail">
					<label style="font-weight:bold" class="control-label">상품 상세설명 이미지</label>
					<input type="file" name="upload_file_detail" id="upload_file_detail"required>
				</div>
				
				<br>
				
				<div class="upload_product_img">
					<label style="font-weight:bold" class="control-label">상품 이미지</label>
					<input type="file" name="upload_file_product" id="upload_file_product" multiple required>
				</div>

				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
				
			</div> <!-- outbox -->
		</fieldset>
		<br>
			
			<fieldset>
			<legend class="bold">선택 입력 항목</legend>
				<div class="checkboxes">
					<p class="center" style="font-weight:bold">  피부 타입 (선택)</p>
					
					<input type="radio" name="product_skintype" value="all" checked>
					<label>선택안함</label>
					
					<input type="radio" name="product_skintype" value="건성">
					<label>건성</label>
					
					<input type="radio" name="product_skintype" value="지성">
					<label>지성 </label> 
					
					<input type="radio" name="product_skintype" value="복합성">
					<label>복합성 </label>
					
					<input type="radio" name="product_skintype" value="민감성">
					<label>민감성 </label>
					
				</div>
				<br>
			</fieldset>
			<br>
	
			<div class="center" style="padding:10px; ">
				<input type="button" id="trigger" style="display:none;">
				<input type="submit" id="btn-submit" class="btn btn-primary btn-lg" style="width:100px; height:50px" value="상품 등록">
				<input type="button" class="cancelBtn btn btn-primary btn-lg" style="width:100px; height:50px" value="등록 취소">
			</div>
			<br>
	</form>
	
	<!— 부트스트랩을 사용하기위한 js설정 입력 —>
	<!— 이미지 파일 등록 오류로 제이쿼리 설정은 위로 올림 —>
<script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/bootstrap.js"></script>
</body>
<jsp:include page="../template/footer.jsp"></jsp:include>
</html>