<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록 페이지</title>
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
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">

<script>

	// 등록된 이미지 클릭 시 새창으로 이미지 열기
	function showImage(fileCallPath, imageType) {
		window.open("/viewImg?fileName=" + fileCallPath + "&imageType="+imageType, "image", "width=700px, height=600px");
	}
	
	
	$(document).ready(function(){
		
		// 비어있는 form 복사
		var formObj = $("form");
		
		// form submit 시 실행
		$("input[type='submit']").on("click", function(e){
			e.preventDefault();
			
			console.log("파일등록");
			
			var str = "";
			
			$(".uploadResult ul li").each(function(i, obj){
				var jobj = $(obj);
				console.dir(jobj);
				
				str += "<input type='hidden' name='uploadFileList["+i+"].image_name' value='"+jobj.data("image_name")+"'>";
				str += "<input type='hidden' name='uploadFileList["+i+"].image_save_name' value='"+jobj.data("image_save_name") + "'>";
				str += "<input type='hidden' name='uploadFileList["+i+"].file_type' value='"+jobj.data("file_type") + "'>";
				str += "<input type='hidden' name='uploadFileList["+i+"].file_size' value='"+jobj.data("file_size") + "'>";
				str += "<input type='hidden' name='uploadFileList["+i+"].image_type' value='"+jobj.data("image_type") + "'>";
			});
			formObj.append(str).submit();
		});
		
		
		// 이미지 파일만 업로드할 수 있게 처리
		var regex = new RegExp("(.*?)\.(jpg|jepg|png)");
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
		
		
		
		// 상품업로드 빈 DIV 복사
		var cloneObj = $(".upload").clone();
		// 상품이미지 업로드 버튼 클릭
		$("#uploadImage").on("click", function(e){
			e.preventDefault();
			// 빈 form 생성
			var formData = new FormData();
			// 사용자가 선택한 파일 변수 생성
			var inputFile = $("input[name='upload_file']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			// fileCheck 함수로 업로드 된 이미지 검사
			for(var i = 0; i < files.length; i++) {
				if(!fileCheck(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			formData.append("image_type", "N");
			
			// 사용자가 업로드한 파일이 담긴 formData ajax 로 전송
			$.ajax({
				url : '/productImg',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						// showUploadFile 변수
						showUploadedFile(result);
						$(".upload").html(cloneObj.html());
					}
			}); 
			
		});// uploadImage
		
		$("#uploadImageDetail").on("click", function(e){
			e.preventDefault(); 
			// 빈 form 생성
			var formData = new FormData();
			// 사용자가 선택한 파일 변수 생성
			var inputFile = $("input[name='upload_file_detail']");
			var files = inputFile[0].files;
			
			console.log(files);
			
			// fileCheck 함수로 업로드 된 이미지 검사
			for(var i = 0; i < files.length; i++) {
				if(!fileCheck(files[i].name, files[i].size)) {
					return false;
				}
				formData.append("uploadFile", files[i]);
			}
			formData.append("image_type", "D");
			
			
			// 사용자가 업로드한 파일이 담긴 formData ajax 로 전송
			$.ajax({
				url : '/productImg',
					processData : false,
					contentType : false,
					data : formData,
					type : 'POST',
					dataType : 'json',
					success : function(result) {
						console.log(result);
						// showUploadFile 변수
						showUploadedFile(result);
						$(".upload").html(cloneObj.html());
					}
		}); // ajax
		});// uploadImageDetail
		
		
		
		
		// 태그 변수 생성
		var uploadResult = $(".uploadResult ul");
		
		// ul 태그에 파일 정보 담긴 li append
		function showUploadedFile(uploadResultArr) {
			var str = "";
			// image_type = "N" 또는 image_type="D"
			
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
			// li 에 생성했던 data-*** 변수에 담기
			var targetFile = $(this).data("file");
			var type = $(this).data("type");
			var targetLi = $(this).closest("li");
			var imageType = $(this).data("image_type");
			console.log($(this).data("image_type"));
			
			$.ajax({
				url : '/deleteImg',
				data : {fileName:targetFile, type:type, imageType:imageType},
				dataType : 'text',
				type : 'POST',
				success : function(result) {
					alert(result);
					
					targetLi.remove();
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
		$(document).on("submit", "form", function(event){
	        $(window).off('beforeunload');
	    });
		
	});
</script>
<body>
	
	<form action="productWrite" method="post" class="center">
		<div>
			<h2 style=font:bold>상품 등록 페이지</h2>
		</div>
		
			<div>
				<p style="font-weight:bold">상품 카테고리</p>
				<label>스킨케어 </label><input type="radio" name="product_category" value="skincare"> 
				<label>메이크업</label><input type="radio" name="product_category" value="makeup">
				<label>바디케어</label><input type="radio" name="product_category" value="bodycare">
				<label>헤어케어</label><input type="radio" name="product_category" value="haircare">
				<label>향수 / 디퓨져</label><input type="radio" name="product_category" value="perfume"> 
				<label>남성케어</label><input type="radio" name="product_category" value="manscare">
			</div>
			<br>
		
		
		
			<div>
				<label style="font-weight:bold">상품 이름</label>
				<input type="text" name="product_name" required placeholder="상품 이름을 입력하시오." size="50">
			</div>
			<br>
		
		
			<div>
				<label style="font-weight:bold">상품 가격</label>
				<input type="text" name="product_price" required placeholder="상품 가격을 입력하시오. 숫자만" size="50">
			</div>
			<br>
			
			<div>
				<label style="font-weight:bold">상품 재고</label>
				<input type="text" name="product_stock" required placeholder="삼품 재고 입력하시오." size="50">
			</div>
			<br>
		
			
			<div>
				<p style="font-weight:bold">  피부 타입 (선택)</p>
				<label>건성</label><input type="radio" name="product_skintype" value="건성">
				<label>지성 </label><input type="radio" name="product_skintype" value="지성"> 
				<label>복합성 </label><input type="radio" name="product_skintype" value="복합성">
				<label>민감성 </label><input type="radio" name="product_skintype" value="민감성">
			</div>
			<br>
			<div class="outbox">
				<div class="upload">
					<label style="font-weight:bold">상품 이미지</label>
					<input type="file" name="upload_file" required multiple>
				</div>
				
				<button id="uploadImage">이미지 등록</button>
				<br>
				
				<div>
					<label style="font-weight:bold">상품 상세설명 이미지</label>
					<input type="file" name="upload_file_detail" required multiple>
				</div>
				<button id="uploadImageDetail">이미지 등록</button>
				<div class="uploadResult">
					<ul>
					
					</ul>
				</div>
				
			</div> <!-- outbox -->
			<br>
				
			
			<div>
				<label style="font-weight:bold">상품 등록자(브랜드)</label>
				<input type="text" name="product_brand" placeholder=" 판매자(브랜드)명이 들어감" size="50">
			</div>
			<br>
			
			
			
			<div>
				<input type="submit" value="상품 등록">
				<input type="button" class="cancelBtn" value="등록 취소">
			</div>
			<br>

	</form>
	
	
	
</body>
</html>