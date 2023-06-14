<%@page import="util.CookieManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login-아이디 저장</title>
</head>
<body>

<form action="01LoginAction.jsp" method="post">
<% 
	// 쿠키에 저장된 아이디 값을 아이디 창에 출력하기
	// 요청 헤더로부터 쿠키를 받아 온 후 아이디 값을 담고 있는 쿠키를 찾는다.
	// 아이디 값을 id 필드의 value 속성에 넣는다.
	/*
	Cookie[] cookies = request.getCookies();
	String userid = "";
	if(cookies!=null){
		for(Cookie cookie:cookies){
			// 생성한 쿠키 이름(userid)과 배열로부터 받아온 쿠키 요소의 이름을 비교하여 
			// 일치하면 쿠키 요소의 값을 변수에 저장 
			if("userid".equals(cookie.getName())){
				userid = cookie.getValue();
				break;
			}
		}		
	}
	*/
	String userid = CookieManager.readCookie(request, "userid");
	
	String name = request.getParameter("name");
	if(name!=null && !name.equals("")){
		out.print(name + "님 환영합니다.");
	} else {
%>
	<div class='loginbox'>
	    <div id='login'>
	    	<!-- 쿠키로부터 받아 온 아이디 값을 id 필드의 value 속성에 넣는다. -->
	        <input type="text" name="userid" id="userid" placeholder='ID를 입력해주세요.' required value="<%= userid %>"><br>
	        <input type="password" name="userpw" id="userpw" placeholder='PW를 입력해주세요.' required><br>
	        <!-- 체크박스에 체크한 후 submit하면 지정된 value 값이 제출되고 그렇지 않으면 null 값이 제출된다. -->
	        <input type="checkbox" name="savecheck" value="Y" <%= !userid.equals("")?"checked":"" %>>아이디저장
	    </div>
	    <div id='button'>
	    <input type="submit" value="로그인">
	    </div>
	</div>
	<div id='info'>
	    <a href="">회원가입</a>
	    <a href="">ID찾기</a>
	    <a href="">PW찾기</a>
	</div>
<%
	} 
%>
</form>                
</body>
</html>