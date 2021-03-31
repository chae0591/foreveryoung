<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form action="productWrite" method="post">
		<div>
			<h2>제품 입력창</h2>
		</div>
		<div>
			<label>상품 카테고리</label>
			<input type="radio" name="product_category" class="input" value="skin"> 스킨케어
			<input type="radio" name="product_category" class="input" value="makeUp"> 메이크업
			<input type="radio" name="product_category" class="input" value="bodyCare"> 바디케어
			<input type="radio" name="product_category" class="input" value="hairCare"> 헤어케어
			<input type="radio" name="product_category" class="input" value="scent"> 향수/디퓨
			<input type="radio" name="product_category" class="input" value="menCare"> 남성케어
		</div>
		
		<div>
			<label>상품 이름</label>
			<input type="text" name="product_name" required placeholder="상품 이름을 입력하시오.">
		</div>
		
		<div>
			<label>상품 이미지 / 설명</label>
			<input type="text" name="product_img" required placeholder="상품 설명 / 이미지를 넣으시오. ">
		</div>
		
		<div>
			<label>상품 가격</label>
			<input type="text" name="product_price" required>
		</div>
		
		<div>
			<label>상품 재고</label>
			<input type="text" name="product_stock" required placeholder="삼품 재고 입력하시오.">
		</div>
		
	
		<div>
			<input type="submit" value="상품 등록">
		</div>
	</form>
	
</body>
</html>