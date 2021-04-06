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

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){
		$("#event_register").click(function(){
			self.location = "/admin/eventRegister"
		})
		$("#event_modify").click(function(){
			//self.location = "/admin/join"
		})
		$("#event_delete").click(function(){
			//self.location = "/admin/join"
		})
	})

</script> 

</head>
<body>
	<h2>이벤트 리스트</h2>
	
	<div>
		<input type="button" id="event_register" value="이벤트 등록">
	</div>
	
	
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
						<td align="center">${eventList.event_start}~
											${eventList.event_end } 
						</td>
						<td align="center">${eventList.event_discount}</td>						
						<td align="center">${eventList.event_target}</td>
						<td align="center">진행상황</td>
						<td align="center">
							<input type="button" id="event_modify" value="수정">
							<input type="button" id="event_delete" value="삭제">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>