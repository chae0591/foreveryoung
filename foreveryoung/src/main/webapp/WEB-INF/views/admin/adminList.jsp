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
		$("#admin_join").click(function(){
			self.location = "/admin/join"
		})
		$("#admin_modify").click(function(){
			//self.location = "/admin/join"
		})
		$("#admin_delete").click(function(){
			//self.location = "/admin/join"
		})
	})

</script> 

</head>
<body>
	<h2>관리자 리스트</h2>
	
	<div>
		<input type="button" id="admin_join" value="관리자 등록">
	</div>
	
	<table border="1">
		<tr>
			<th align="center" width="100">관리자번호</th>
			<th align="center" width="100">관리자ID</th>
			<th align="center" width="100">관리자 이름</th>
			<th align="center" width="160">전화번호</th>
			<th align="center" width="160">등록일</th>
			<th align="center" width="160"> </th>
		</tr>
		
				<c:choose>
			<c:when test="${empty adminList}">
				<tr>
					<td colspan="6">
						관리자 계정이 없습니다.
					</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach items="${adminList}" var="adminList">
					<tr>
						<td align="center">${adminList.admin_no}</td>
						<td align="center">${adminList.admin_id}</td>
						<td align="center">${adminList.admin_name}</td>
						<td align="center">${adminList.admin_regDate}</td>
						<td align="center">${adminList.admin_phone}</td>
						<td align="center">
							<input type="button" id="admin_modify" value="수정">
							<input type="button" id="admin_delete" value="삭제">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>