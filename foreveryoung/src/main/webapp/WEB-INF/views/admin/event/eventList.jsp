<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>이벤트 리스트</h2>
	<table border="1">
		<tr>
			<th align="center" width="100">이벤트 번호</th>
			<th align="center" width="100">이벤트명</th>
			<th align="center" width="100">이벤트 기간</th>
			<th align="center" width="100">이벤트 할인율</th>
			<th align="center" width="160">이벤트 적용대상</th>
			<th align="center" width="100">진행상황</th>
			<th align="center" width="160"></th>
		</tr>
		
				<c:choose>
			<c:when test="${empty eventList}">
				<tr>
					<td colspan="7">
						이벤트가 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${eventList}" var="eventList">
					<tr>
						<td align="center">${eventList.event_no}</td>
						<td align="center">${eventList.event_name}</td>
						<td align="center">
							<javatime:format value="${eventList.event_start}"
								pattern="yyyy-MM-dd"/> ~
							<javatime:format value="${eventList.event_end}"
								pattern="yyyy-MM-dd"/>
						</td>
						<td align="center">${eventList.event_discount}</td>						
						<td align="center">${eventList.event_target}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>