<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Poppins">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/product/productCommon.css">

<title>판매자 페이지 메인</title>
<style>
 	/* 사이드 매뉴 위치 잡아주기  */
	.s_left {
		width: 200px; 
		hegith: 700px;
		float:left; 	
	}
	
	/*센터 레프트(달럭) */
	.center_left{
		float:left;
		padding-top: 100px;
	    padding-left: 400px;
	    
	    /* border-spacing  */
	    padding-right:175px;
	    
   	    border-right: 6px solid red;
 	    border-collapse: separate;
  	    height:900px; 
	}
	
	.vertical-menu {
	  width: 200px; /* Set a width if you like */
	}
	
	.vertical-menu a {
	  background-color: #eee; /* Grey background color */
	  color: black; /* Black text color */
	  display: block; /* Make the links appear below each other */
	  padding: 40px; /* Add some padding */
	  text-decoration: none; /* Remove underline from links */
	}
	
	.vertical-menu a:hover {
	  background-color: #ccc; /* Dark grey background on mouse-over */
	}
	
	.vertical-menu a.active {
	  background-color: #4CAF50; /* Add a green color to the "active/current" link */
	  color: white;
	}
	
	.font-size{
		font-size: 17px; 
	}
	
	.font{
	     font-family :'나눔고딕', 'Malgun Gothic', sans-serif;
	 }
	
	 
	 .center{
	     text-align: center; 
	     
	 }
	 
	 
	 .bold{
	     font-weight: bold;
	 }
	 
	 
	 
	 
	/* 센터 라이트(투두) */
	/* Include the padding and border in an element's total width and height */
	  .toDo {
	     position: absolute; 
	     width:500px;
	     float:left; 
	     right:100px;
	     padding-top: 30px; 
	     /* padding-right: 100px; */
	 }
	   
	* {
	  box-sizing: border-box;
	}
	
	/* Remove margins and padding from the list */
	ul {
	  margin: 0;
	  padding: 0;
	}
	
	/* Style the list items */
	ul li {
	  cursor: pointer;
	  position: relative;
	  padding: 12px 8px 12px 40px;
	  list-style-type: none;
	  background: #eee;
	  font-size: 18px;
	  transition: 0.2s;
	  
	  /* make the list items unselectable */
	  user-select: none;
	}
	
	/* Set all odd list items to a different color (zebra-stripes) */
	ul li:nth-child(odd) {
	  background: #f9f9f9;
	}
	
	/* Darker background-color on hover */
	ul li:hover {
	  background: #ddd;
	}
	
	/* When clicked on, add a background color and strike out text */
	ul li.checked {
	  background: #888;
	  color: #fff;
	  text-decoration: line-through;
	}
	
	/* Add a "checked" mark when clicked on */
	ul li.checked::before {
	  content: '';
	  position: absolute;
	  border-color: #fff;
	  border-style: solid;
	  border-width: 0 2px 2px 0;
	  top: 10px;
	  left: 16px;
	  transform: rotate(45deg);
	  height: 15px;
	  width: 7px;
	}
	
	/* Style the close button */
	.close {
	  position: absolute;
	  right: 0;
	  top: 0;
	  padding: 12px 16px 12px 16px;
	}
	
	.close:hover {
	  background-color: #f44336;
	  color: white;
	}
	
	/* Style the header */
	.header {
	  background-color: #f44336;
	  padding: 30px 40px;
	  color: white;
	  text-align: center;
	}
	
	/* Clear floats after the header */
	.header:after {
	  content: "";
	  display: table;
	  clear: both;
	}
	
	/* Style the input */
	input {
	  margin: 0;
	  border: none;
	  border-radius: 0;
	  width: 75%;
	  padding: 10px;
	  float: left;
	  font-size: 16px;
	}
	
	/* Style the "Add" button */
	.addBtn {
	  padding: 10px;
	  width: 25%;
	  background: #d9d9d9;
	  color: #555;
	  float: left;
	  text-align: center;
	  font-size: 16px;
	  cursor: pointer;
	  transition: 0.3s;
	  border-radius: 0;
	}
	
	.addBtn:hover {
	  background-color: #bbb;
	
	}
	
	  .orderInfo {
	     position: absolute; 
	     float:left; 
	     right:250px;
	     padding-top: 400px; 
	     font-weight:bold; 
	     /* padding-right: 100px; */
	 }
	
</style>

<script>
		// Create a "close" button and append it to each list item
		var myNodelist = document.getElementsByTagName("LI");
		var i;
		for (i = 0; i < myNodelist.length; i++) {
		  var span = document.createElement("SPAN");
		  var txt = document.createTextNode("\u00D7");
		  span.className = "close";
		  span.appendChild(txt);
		  myNodelist[i].appendChild(span);
		}
		
		// Click on a close button to hide the current list item
		var close = document.getElementsByClassName("close");
		var i;
		for (i = 0; i < close.length; i++) {
		  close[i].onclick = function() {
		    var div = this.parentElement;
		    div.style.display = "none";
		  }
		}
		
		// Add a "checked" symbol when clicking on a list item
		var list = document.querySelector('ul');
		list.addEventListener('click', function(ev) {
		  if (ev.target.tagName === 'LI') {
		    ev.target.classList.toggle('checked');
		  }
		}, false);
		
		// Create a new list item when clicking on the "Add" button
		function newElement() {
		  var li = document.createElement("li");
		  var inputValue = document.getElementById("myInput").value;
		  var t = document.createTextNode(inputValue);
		  li.appendChild(t);
		  if (inputValue === '') {
		    alert("할일을 입력해주세요! ");
		  } else {
		    document.getElementById("myUL").appendChild(li);
		  }
		  document.getElementById("myInput").value = "";
		
		  var span = document.createElement("SPAN");
		  var txt = document.createTextNode("\u00D7");
		  span.className = "close";
		  span.appendChild(txt);
		  li.appendChild(span);
		
		  for (i = 0; i < close.length; i++) {
		    close[i].onclick = function() {
		      var div = this.parentElement;
		      div.style.display = "none";
		    }
		  }
		}
</script>


</head>
<body>

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
	    <a href="mypage_brand_product" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">판매 상품관리</a> 
	    <a href="mypage_brand_order" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">주문 관리</a> 
	    <a href="mypage_brand_chart" onclick="w3_close()" class="w3-bar-item w3-button w3-hover-white">통계</a> 
	  </div>
	</nav>
</div>




<!-- center_left 판매자 정보 + 달럭 -->
<div class="center_left">
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
	</div>
	
	
</body>
</html>