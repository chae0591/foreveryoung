<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<!-- Common Design Link -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/css/bootstrap.css">
<!-- 투두 리스트 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/product/css/Todo.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>

<title>판매자 페이지 메인</title>
<style>

	.left {
	
	width:50%; 
	float:left; 
	
	}
	.right{
	width:50%;
	float:right; 
	}

nav, section {
		padding:10px;
	}
	section {
		width:1450px;
		float:right; 
	}
	.menu a:hover {
	    background:#e9d319;
	    color: #000;
	}
	.menu a.active {
	    background:#e9d319;
	    color: #000;
	}
	.title{
		padding-top:30px; 
		padding-left:50px;
	}

	
	/* 사이드 바 디자인  */
	
	/* 사이드바 래퍼 스타일 */
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: #000;
    overflow-x: hidden;
    overflow-y: auto;
  }
  
  #page-content-wrapper {
    width: 100%;
    padding: 20px;
  }
  /* 사이드바 스타일 */
  
  .sidebar-nav {
    width: 250px;
    margin: 0;
    padding: 0;
    list-style: none;
  }
  
  .sidebar-nav li {
    text-indent: 1.5em;
    line-height: 2.8em;
  }
  
  .sidebar-nav li a {
    display: block;
    text-decoration: none;
    color: #999;
  }
  
  .sidebar-nav li a:hover {
    color: #fff;
    background: rgba(255, 255, 255, 0.2);
  }
  
  .sidebar-nav > .sidebar-brand {
    font-size: 1.3em;
    line-height: 3em;
  }
  
  .active {
  	background-color: #666;
  }
/* 끝 */

	.bold{
	     font-weight: bold;
	 }
	 
	 /* 회원정보 수정 버튼  */
	 .button{
	 	display:inline-block;
	 	transition-duration:0.4s;
	 	cursor:pointer;
	 }
	 
	.button1{
		border: 2px solid black;
		background: rgba(255, 255, 255, 0.2);
	}
	 
	.button1:hover{
		background-color: #C0C0C0;
	}
	/* 회원정보 수정 버튼 - 끝 */
	
	.vl {
	  border-left: 6px solid black;
	  height: 1000px;
	  position: absolute;
	  left: 60%; 
	  top: 0; 
	}
	
	
	/* 시계 디자인  */
	.clock { width: 300px; height: 100px; background: white; color:black; padding-left:50px;}
	/* .clock .time_box { width: 100%; padding-left: 10px; } */
	.clock span { color: black; }
	.txt_lg { font-size: 75px; }
	.txt_sm { font-size: 20px; }
	.date_box { font-size: 15px; }
	.mark01 {  height: 100px; margin-left: 1px; line-height: 94px; font-size: 55px; }
	.mark02 { display: inline-block; margin-left: -3px; }
	/* 시계 디자인  - 끝 */
</style>

<script>
	


	/* 투두리스트  */
	$( document ).ready(function() {
		var clockStart = setInterval(function() {
			var today = new Date()
			var dayList = ['sunday', 'monday', 'tuesday', 'wednesday', 'thursday', 'friday', 'saturday']
			var hh = addZero(today.getHours())
			var mm = addZero(today.getMinutes())
			var ss = addZero(today.getSeconds())
			var YY = today.getFullYear()
			var MM = today.getMonth()+1
			var DD = today.getDate()
			var dd = dayList[today.getDay()].toUpperCase()
			document.getElementById('hours').innerText = hh
			document.getElementById('min').innerText = mm
			document.getElementById('sec').innerText = ss
			function addZero(num) {
			return (num < 10 ? '0'+num : ''+num)
			}
		}, 1000)
		
		
		
    "use strict";
    
    var todo = function() { 
        $('.todo-list .todo-item input').click(function() {
        if($(this).is(':checked')) {
            $(this).parent().parent().parent().toggleClass('complete');
        } else {
            $(this).parent().parent().parent().toggleClass('complete');
        }
    });
    
    $('.todo-nav .all-task').click(function() {
        $('.todo-list').removeClass('only-active');
        $('.todo-list').removeClass('only-complete');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $('.todo-nav .active-task').click(function() {
        $('.todo-list').removeClass('only-complete');
        $('.todo-list').addClass('only-active');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $('.todo-nav .completed-task').click(function() {
        $('.todo-list').removeClass('only-active');
        $('.todo-list').addClass('only-complete');
        $('.todo-nav li.active').removeClass('active');
        $(this).addClass('active');
    });
    
    $('#uniform-all-complete input').click(function() {
        if($(this).is(':checked')) {
            $('.todo-item .checker span:not(.checked) input').click();
        } else {
            $('.todo-item .checker span.checked input').click();
        }
    });
    
    $('.remove-todo-item').click(function() {
        $(this).parent().remove();
    });
    };
    
    todo();
    
    $(".add-task").keypress(function (e) {
        if ((e.which == 13)&&(!$(this).val().length == 0)) {
            $('<div class="todo-item"><div class="checker"><span class=""><input type="checkbox"></span></div> <span>' + $(this).val() + '</span> <a href="javascript:void(0);" class="float-right remove-todo-item"><i class="icon-close"></i></a></div>').insertAfter('.todo-list .todo-item:last-child');
            $(this).val('');
        } else if(e.which == 13) {
            alert('Please enter new task');
        }
        $(document).on('.todo-list .todo-item.added input').click(function() {
            if($(this).is(':checked')) {
                $(this).parent().parent().parent().toggleClass('complete');
            } else {
                $(this).parent().parent().parent().toggleClass('complete');
            }
        });
        $('.todo-list .todo-item.added .remove-todo-item').click(function() {
            $(this).parent().remove();
        });
    });
}); 
		
</script>


</head>
<body>
<!-- <div class="total">
	<div class="menus">
	
	</div>
	<div class="left">
	</div>
	<div class="right">
	
	</div>
</div>
 -->
<div id="page-wrapper">
  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <a href="#">포에버영 판매자 페이지</a>
      </li>
      <li class="active"><a href="mypage_brand_main"> 판매자 메인</a></li>
      <li><a href="mypage_brand_buyer">구매자 관리</a></li>
      <li><a href="mypage_brand_product">판매상품 관리</a></li>
      <li><a href="mypage_brand_order">주문 관리</a></li>
      <li><a href="mypage_brand_chart">통계</a> </li>
    </ul>
  </div>
  <!-- /사이드바 -->
  
  <!-- 본문 -->
	<div id="page-content-wrapper">
	    <div class="container-fluid">
	    <div class="left">
	    		<!-- 시계  -->
   			  <div class="clock" style="margin: 0 auto;">
				<div class="time_box">
					<span class="txt_lg" id="hours"></span>
					<span class="mark01">:</span>	
					<span class="txt_lg" id="min"></span>
					<span class="mark02">.</span>
					<span class="txt_sm" id="sec"></span>
				</div>
			</div>
				<h2 class="bold" style="text-align:center;">* 판매자 정보창 *</h2><br>
				<!-- 정보창  -->
				<div style="padding-left: 200px;">
				<table>
					<tr>
						<td class="bold" style="display:none">판매자 번호: <c:out value="${brand_info.brand_num}"></c:out> </td>
					</tr>
					<tr>
						<td> <label class="bold">판매자 아이디:</label> <c:out value="${brand_info.brand_id}"></c:out></td>
					</tr>
					<tr>
						<td> <label class="bold">판매자 이름:</label> <c:out value="${brand_info.brand_name}"></c:out></td>
					</tr>
					<tr>
						<td> <label class="bold">판매자 전화번호:</label> <c:out value="${brand_info.brand_phone}"></c:out></td>
					</tr>
					<tr>
						<td> <label class="bold">판매자 가입일:</label> <c:out value="${brand_info.brand_regDate}"></c:out></td>
					</tr>
				</table><br><br><br><br>
			<!-- 판매자 정보 끝 -->	
				</div>
			
			
			<!--달럭  -->
			<%
				Calendar cr = Calendar.getInstance();
				int year = cr.get(Calendar.YEAR);
				int month = cr.get(Calendar.MONTH);
				int date = cr.get(Calendar.DATE);
				String today = year + ":" +(month+1)+ ":"+date; // 오늘 날짜
				// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
				cr.set(year, month, 1);
				 
				// 셋팅한 날짜로 부터 아래 내용을 구함
				 
				// 해당 월의 첫날를 구함
				int startDate = cr.getMinimum(Calendar.DATE);
				 
				// 해당 월의 마지막 날을 구함
				int endDate = cr.getActualMaximum(Calendar.DATE);
				 
				// 1일의 요일을 구함
				int startDay = cr.get(Calendar.DAY_OF_WEEK);
				int count = 0;
			%>
		<div style="margin: 0 auto;">
				<div style="text-align: center; margin: 0 auto;">
			 	<p class="bold"><%=year%>년 <%=month+1%>월 <%=date%>일 </p>
				 <table width="400" cellpadding="2" cellspacing="0" border="1" align="center">
				
				 <tr class="bold" height="30">
				 <td><font size="2">일</font></td>
				 <td><font size="2">월</font></td>
				 <td><font size="2">화</font></td>
				 <td><font size="2">수</font></td>
				 <td><font size="2">목</font></td>
				 <td><font size="2">금</font></td>
				 <td><font size="2">토</font></td>
				 </tr>
				 <tr height="30">
					<%
						for (int i=1;i<startDay;i++){
						 count++;
					%>
				 		<td>&nbsp;</td>
					<%
						}
						for (int i=startDate;i<=endDate;i++){
						 String bgcolor = (today.equals(year+":"+(month+1)+":"+i))? "#CCCCCC" : "#FFFFFF";
						 String color = (count%7 == 0 || count%7 == 6)? "red" : "black";
						 count++;
					%>
				  		<td bgcolor="<%=bgcolor %>"><font size="2" color=<%=color %>><%=i %></font></td>
					<%
				 		 if(count%7 == 0 && i < endDate){
					%>
						 </tr>
						 <tr height="30">
						<%
						  }
						}
						while(count%7 != 0){
					%>
				       <td>&nbsp;</td>
					<%
						count++;
						 }
					%>
					</tr> 
				</table>
			</div>
			<!-- 달럭 끝  -->
		</div>
			
	    </div>
	    <!-- 왼쪽 끝 -->
   	
			<!--가로 줄   -->
			<div class="vl"></div> 
			<!--가로 줄 end   -->
			<div class="right">
				<div>
	    		<a href="mypage_brand_main_edit">
	    		<button type="button" class="btn btn-secondary button button1" style="color:black;">회원정보 수정하러가기</button>
				</a>
	    		</div><br>
	    		<!--	투두 리스트 -->
	    		<div style="width:500px; margin: 0 auto; padding-left:75px; padding-botton:50px; ">
	    		 <div class="wrapper">
				    <header>To-do 리스트</header>
				    <div class="inputField">
				      <input type="text" placeholder="할일을 입력하세요. ">
				      <button style=""><i class="fas fa-plus"></i></button>
				    </div>
				    <ul class="todoList">
				      <!-- data are comes from local storage -->
				    </ul>
				    <div class="footer">
				      <span>진행중인 to-do가 <span class="pendingTasks"></span> 개 있습니다. </span>
				      <button>모두 지우기</button>
				    </div>
				  </div>
				    <script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/Todo.js"></script>
	    		</div>
				
	    		
			</div>
	    	
		</div>
	</div>
</div>
<%-- 
<div id="left">
	<!-- Sidebar/menu -->
	<nav class="w3-sidebar w3-red w3-collapse w3-top w3-large w3-padding" style="z-index:3;width:300px;font-weight:bold;" id="mySidebar"><br>
	  <a href="javascript:void(0)" onclick="w3_close()" class="w3-button w3-hide-large w3-display-topleft" style="width:100%;font-size:22px">Close Menu</a>
	  <div class="w3-container">
	    <h3 class="w3-padding-64"><b>포에버영<br>판메자 페이지</b></h3>
	  </div>
	  <div class="w3-bar-block">
	    <a href="mypage_brand_main" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매자 메인</a> 
	    <a href="mypage_brand_buyer" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">구매자 관리</a> 
	    <a href="mypage_brand_product?brand=${brand_info.brand_num}" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매 상품관리</a> 
	   <a href="mypage_brand_product" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매 상품관리</a>  
	    <a href="mypage_brand_order" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">주문 관리</a> 
	    <a href="mypage_brand_chart" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">통계</a>
	  </div>
	</nav>
</div> --%>




<!-- center_left 판매자 정보 + 달럭 -->
<%-- <div class="center_left">
		<a href="mypage_brand_main_edit">회원정보 수정</a>
		<table>
			<tr>
				<td class="bold" style="display:none">판매자 번호: <c:out value="${brand_info.brand_num}"></c:out> </td>
			</tr>
			<tr>
				<td class="bold">판매자 아이디: <c:out value="${brand_info.brand_id}"></c:out></td>
			</tr>
			<tr>
				<td class="bold">판매자 이름: <c:out value="${brand_info.brand_name}"></c:out></td>
			</tr>
			<tr>
				<td class="bold">판매자 전화번호: <c:out value="${brand_info.brand_phone}"></c:out></td>
			</tr>
			<tr>
				<td class="bold">판매자 가입일: <c:out value="${brand_info.brand_regDate}"></c:out></td>
			</tr>
		</table><br><br>
		
	<!-- 달럭 -->
	<%
		Calendar cr = Calendar.getInstance();
		int year = cr.get(Calendar.YEAR);
		int month = cr.get(Calendar.MONTH);
		int date = cr.get(Calendar.DATE);
		String today = year + ":" +(month+1)+ ":"+date; // 오늘 날짜
		// 1일부터 시작하는 달력을 만들기 위해 오늘의 연도,월을 셋팅하고 일부분은 1을 셋팅한다.
		cr.set(year, month, 1);
		 
		// 셋팅한 날짜로 부터 아래 내용을 구함
		 
		// 해당 월의 첫날를 구함
		int startDate = cr.getMinimum(Calendar.DATE);
		 
		// 해당 월의 마지막 날을 구함
		int endDate = cr.getActualMaximum(Calendar.DATE);
		 
		// 1일의 요일을 구함
		int startDay = cr.get(Calendar.DAY_OF_WEEK);
		int count = 0;
	%>

	<div class="">
		 <p class="center bold" style="padding-left:30px"><%=year%>년 <%= month+1%>월 <%=date%>일 </p>
		 <table width="400" cellpadding="2" cellspacing="0" border="1" align="center">
		 <tr height="30">
		 <td><font size="2">일</font></td>
		 <td><font size="2">월</font></td>
		 <td><font size="2">화</font></td>
		 <td><font size="2">수</font></td>
		 <td><font size="2">목</font></td>
		 <td><font size="2">금</font></td>
		 <td><font size="2">토</font></td>
		 </tr>
		 <tr height="30">
			<%
				for (int i=1;i<startDay;i++){
				 count++;
			%>
		 		<td>&nbsp;</td>
			<%
				}
				for (int i=startDate;i<=endDate;i++){
				 String bgcolor = (today.equals(year+":"+(month+1)+":"+i))? "#CCCCCC" : "#FFFFFF";
				 String color = (count%7 == 0 || count%7 == 6)? "red" : "black";
				 count++;
			%>
		  		<td bgcolor="<%=bgcolor %>"><font size="2" color=<%=color %>><%=i %></font></td>
			<%
		 		 if(count%7 == 0 && i < endDate){
			%>
				 </tr>
				 <tr height="30">
				<%
				  }
				}
				while(count%7 != 0){
			%>
		       <td>&nbsp;</td>
			<%
				count++;
				 }
			%>
			</tr> 
		</table>
	</div>
	
	

<!-- 가로줄 -->
	<!-- <div class="vi"></div> -->
<!-- center_left 판매자 정보 + 달럭 마무리 -->
</div>


	
<!--	투두 리스트 -->
	<div class="toDo center_right">
	      <div id="myDIV" class="header">
              <h2 class="font">To-Do List작성</h2>
              <input type="text" id="myInput" placeholder="할일을 입력해주세요~ ">
              <span onclick="newElement()" class="addBtn font bold" style="color: black">추가하기</span>
          </div>

          <ul id="myUL">
          </ul>
	</div>
	
	
	<!-- 주문 관련 정보  -->
	
	<div class="center_right orderInfo">
		<h2>주문 관련 정보</h2>
	</div> --%>
	
<script type="text/javascript" src="${pageContext.request.contextPath}/css/product/js/bootstrap.js"></script>
</body>
</html>