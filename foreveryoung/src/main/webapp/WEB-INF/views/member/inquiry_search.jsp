<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>


<thead>
	<tr>
		<th>날짜</th>
		<th style="width: 70%">제목</th>
		<th>상태</th>
	</tr>
</thead>
<tbody>
	<c:choose>
		<c:when test="${empty inquiry_info}">
			<tr>
				<th colspan="3">문의 사항이 없습니다.</th>
			</tr>
		</c:when>
		<c:otherwise>
			<c:forEach var="inq" items="${inquiry_info}">
				<tr>
					<td><c:out value="${inq.inquiry_regDate}"></c:out></td>
					<td><a href="/service_center/inquiryDetail?inquiry_no=${inq.inquiry_no}"><c:out value="${inq.inquiry_title}"></c:out></a></td>
					<td>
						<c:choose>
							<c:when test="${inq.reply_no eq 0}">
								처리중 
							</c:when>
							<c:otherwise>
								답변 완료
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
</tbody>