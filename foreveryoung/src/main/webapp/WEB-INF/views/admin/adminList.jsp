<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>






<script>
	$(document).ready(function(){
		$("#admin_join").click(function(){
			self.location = "/admin/join"
		})
		$("#admin_modify").click(function(){
			//self.location = "/admin/"
		})
		$("#admin_delete").click(function(){
			//self.location = "/admin/"
		})
		
		$(".modal_on").click(function(){
			  $('#myModal').show();
		})
		
		$(".modal_off").click(function(){
			$('#myModal').hide();
		})
		
		
	})

</script> 

</head>

<body>

		<!-- 관리자 모드 메뉴 -->
			<a href="/admin/login">로그인</a>
			<a href="/admin/dashBoard">대시보드</a>
			<a href="/admin/adminList">관리자페이지</a>
			<a href="/admin/brandList">판매자관리</a>
			<a href="/admin/customerList">고객관리</a>
			<a href="/admin/productList">상품관리</a>
			<a href="/admin/eventList">이벤트관리</a>
			<a href="/admin/noticeList">공지사항관리</a>
			<a href="/admin/inquiryList">1:1문의관리</a>
			<a href="#">리뷰신고관리</a>
			<a href="/admin/staticCustomer">통계관리(회원분석)</a> 
			<a href="/admin/staticSales">통계관리(매출분석)</a> 

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
						<td align="center">${adminList.admin_phone}</td>
						<td align="center">${adminList.admin_regDate}</td>
						<td align="center">
							<input type="button" class="modal_on" value="수정">
							<input type="button" id="admin_delete" value="삭제">
						</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
	

   <!-- The Modal -->
    <div id="myModal" class="modal">
 
      <!-- Modal content -->
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">관리자 정보수정</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />ID </p>
                <p style="text-align: center; line-height: 1.5;"><br />PASSWORD
					  	<input type="password" name="admin_pw" placeholder="비밀번호를 입력해주세요">                
               	</p>
                <p style="text-align: center; line-height: 1.5;"><br />NAME
                	<input type="text" name="admin_name" placeholder="이릅을 입력해주세요">
                </p>
                <p style="text-align: center; line-height: 1.5;"><br />PHONE NUMBER
                	<input type="text" name="admin_phone" id="phone" placeholder="전화번호를 입력해주세요">
                </p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
				<button id="admin_modify">수정하기</button>
				<button class="modal_off">취소하기</button>
            </div>
      </div>
 
    </div>








</body>
</html>