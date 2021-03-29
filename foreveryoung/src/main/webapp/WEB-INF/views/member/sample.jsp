<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>통짜</title>
    <style>
        html,
        body {
            margin: 0;
            padding: 0;
        }
        *{
            box-sizing: border-box;
        }
        
        .login-wrapper{
            width: 400px;
            margin: 0 auto;
        }
        
        .login-wrapper > .login-title{
            text-align: center;
            font-size: 50px;
        }
        .login-wrapper > .login-id{
            width: 100%;
            font-size: 25px;
            margin: 10px 0px; /* 좌우 마진은 폭에 영향을 미친다 */
            padding: 10px;
            
            /* background 속성으로 이미지 설정 */
            padding-left: 45px;
            background-image: url("./image/envelope-mail.png");
            background-size: 30px;
            background-repeat: no-repeat;
            background-position: 7.5px;

        }
        .login-wrapper > .login-pw{
            width: 100%;
            font-size: 25px;
            margin: 10px 0px;
            padding: 10px;
            
            /* background 속성으로 이미지 설정 */
            padding-left: 45px;
            background-image: url("./image/lock.png");
            background-size: 30px;
            background-repeat: no-repeat;
            background-position: 7.5px;
        }
        .login-wrapper > .login-btn{
            width: 100%;
            font-size: 25px;
            margin: 10px 0px;
            padding: 10px;
            background-color: dodgerblue;
            color: white;
            border: none;
        }
        .login-wrapper > .join-btn{
            width: 100%;
            font-size: 25px;
            margin: 10px 0px;
            padding: 10px;
            background-color: white;
            color: dodgerblue;
            border: 1px solid gray;
        }  
    </style>
</head>
<body>
    <div class="login-wrapper">
    	<form action="sample" method="post"></form>
        <div class="login-title">foreveryoung</div>
        <input type="text" class="login-id" name="member_id">
        <input type="password" class="login-pw" name="member_pw">
        <input type="checkbox" name="auto_login">
        <label>자동로그인</label>
        <input type="submit" value="로그인" class="login-btn">
        <hr>
        <input type="button" value="회원가입" class="join-btn">
    </div>
</body>
</html>