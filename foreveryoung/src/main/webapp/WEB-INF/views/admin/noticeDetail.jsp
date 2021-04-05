<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

<script>
	$(document).ready(function(){
		$("#notice_modify").click(function(){
			//self.location = "/admin/noticeModify"
		})
		$("#notice_delete").click(function(){
	
		})
		
	})

</script> 

</head>
<body>

		<h2>공지사항 상세보기</h2>
		
		<table border="1">
			<tr>
				<th align="center" width="100">분류</th>
				<td></td>
			</tr>
			<tr>
				<th align="center" width="100">제목</th>
				<td></td>
			</tr>
			<tr>
				<th align="center" width="100">공지글 내용</th>
				<td></td>			
			</tr>
		</table>
		
		<button id="notice_modify">수정</button>
		<button id="notice_delete">삭제</button>
		
</body>
</html>