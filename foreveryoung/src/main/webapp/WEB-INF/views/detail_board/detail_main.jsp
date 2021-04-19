<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="javatime" uri="http://sargue.net/jsptags/time" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
<script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
<style>
.detail-all{
	border : 3px blue solid;
	width : 1200px;
	maring-right : 20%;
	margin-left : 20%;
	height : 800px;
}
.main-img{
	border : 2px red solid;
	width : 550px;
	height : 750px;
}
</style>
<script type="text/javascript">
	
</script>

<head>
</head>

<body>
<jsp:include page="../template/header.jsp"></jsp:include>
<div class="detail-all">
	<div class="main-img">
			<c:forEach items="${productList}  var="productList">
				<table>
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
					</tr>
					<tr>
						<th></th>
						<th></th>
					</tr>
					
					<tr>
					</tr>
				</table>
			</c:forEach>

	</div>


</div>
<jsp:include page="../template/footer.jsp"></jsp:include>
</body>
</html>