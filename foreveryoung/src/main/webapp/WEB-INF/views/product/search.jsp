<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<ul class="pList">
	<c:forEach var="lists" items="${list}">
		<li>
			<input type="hidden" name="product_no" value="${lists.product_no}">
			<a class="detail" href="#">
					<img class="img-responsive" src="/viewImg?fileName=${lists.image_save_name}&imageType=${lists.image_type}">
					<label><c:out value="${lists.brand_name}"/></label>
				<label><c:out value="${lists.product_name}" /></label>
				<label class="price"><fmt:formatNumber value="${lists.product_price}" pattern="###,###,###"/>원</label>
			</a>
				<button class="vot_btn" data-no="${lists.product_no}" value="false">
					<img src="/img/product/unlike.png" id="vote_img" alt="좋아요" class="like">
				</button>
		</li>
	</c:forEach>
		</ul>

<div class="text-center paging">
	<ul class="pagination">
		<c:if test="${page.prev}">
	<li class="paginate_button previous">
		<a href="${page.startPage-1}">Prev</a>
	</li>
</c:if>

<c:forEach var="num" begin="${page.startPage}" end="${page.endPage}">
	<li class="paginate_button ${page.pageNum == num ? "active":""} ">
		<a href="${num}">${num}</a>
	</li>
</c:forEach>

<c:if test="${page.next}">
	<li class="paginate_button next">
		<a href="${page.endPage+1}">Next</a>
	</li>
</c:if>
	</ul>
</div>
   	<input type="hidden" name='pageNum' value='${page.pageNum}'>
 	<input type="hidden" name='amount' value='${page.amount}'>