<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<div id="pListAjax" >
		<c:forEach var="lists" items="${list}">
		<li>
			<input type="hidden" name="product_no" value="${lists.product_no}">
			<a href="/main">
				<img src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}" style="width:150px; height:150px">
				<label><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
				<label><c:out value="${lists.product_name}" /></label>
			</a>
				<button class="vot_btn" data-no="${lists.product_no}" value="false">
					<img src="/img/product/unlike.png" id="vote_img" style="width:25px; heigth:25px;" alt="좋아요" class="like">
				</button>
			</li>
		</c:forEach>
</div>
