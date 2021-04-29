<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

	<c:forEach var="bestList" items="${bestList}" begin="1" end="8" step="1" >
		<li>
			<input type="hidden" name="product_no" value="${bestList.product_no}">
			<a class="detail" href="#">
 				<img class="img-responsive" src="/viewImg?fileName=${bestList.image_save_name}&imageType=${bestList.image_type}">
 				<label class="brand"><c:out value="${bestList.brand_name}"/></label>
				<label><c:out value="${bestList.product_name}" /></label>
				<label class="price"><fmt:formatNumber value="${bestList.product_price}" pattern="###,###,###"/>원</label>
			</a>
				<button class="vot_btn" data-no="${bestList.product_no}" value="false">
					<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
				</button>
		</li>
	</c:forEach>
