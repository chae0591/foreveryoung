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

<script>
	$(document).ready(function(){
		$(".eventList_btn").click(function(){
			self.location = "/admin/eventList"
		})
	})

</script> 


</head>
<body>
	    <form action ="eventRegister" method="post">
        	<div>
        		<h1>이벤트 등록</h1>
        	</div>
            	
            <div>
            	<label>이벤트명</label><br><br>
                <input type="text"  name="event_name" id="event_name" placeholder="아이디를 입력해주세요."><br><br>
			</div>
				
           	<div>
                <label>이벤트기간</label><br><br>
            	<input type="date" name="event_start" id="event_start"> ~
            	<input type="date" name="event_end" id="event_end">
            	<br><br>
            </div>
            	
            <div>
            	<label>이벤트 할인율</label><br><br>
            	<input type="text" name="event_discount" id="event_discount" >%<br><br>
       		</div>
       			
       			
       		<div>
            	<label>이벤트 적용대상</label><br><br>
            	<input type="text" name="event_target" id="event_target"><br><br>
            </div>
            	
            	
            <div>
            	<input type="submit"  value="등록">
            	<input type="button" class="eventList_btn" value="취소">
        	</div>
        	
    	</form>
</body>
</html>