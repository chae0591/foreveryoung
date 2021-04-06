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

<!-- 모달 기본스타일 -->
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
		$("#event_register").click(function(){
			self.location = "/admin/eventRegister"
		})
		$("#event_modify").click(function(){
			//self.location = "/admin/"
		})
		$("#event_delete").click(function(){
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
							<input type="button"  class="modal_on"  value="수정">
							<input type="button" id="event_delete" value="삭제">
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
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">이벤트 수정</span></b></span></p>
                <p style="text-align: center; line-height: 1.5;"><br />
                	<label>이벤트명</label>
                	<input type="text"  name="event_name" id="event_name" placeholder="이벤트명을 입력해주세요.">
                 </p>
                <p style="text-align: center; line-height: 1.5;"><br />
                	 <label>이벤트기간</label>
					<input type="date" name="event_start" id="event_start"> ~
            		<input type="date" name="event_end" id="event_end">              
               	</p>
                <p style="text-align: center; line-height: 1.5;"><br />
                	<label>이벤트 할인율</label>
                	<input type="text" name="event_discount" id="event_discount" >%
                </p>
                <p style="text-align: center; line-height: 1.5;"><br />
                	<label>이벤트 적용대상</label>
                	<input type="text" name="event_target" id="event_target">
                </p>
                <p><br /></p>
            <div style="cursor:pointer;background-color:#DDDDDD;text-align: center;padding-bottom: 10px;padding-top: 10px;" onClick="close_pop();">
				<button id="event_modify">수정하기</button>
				<button class="modal_off">취소하기</button>
            </div>
      </div>
 
    </div>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>