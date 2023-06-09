<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키</title>
</head>
<body>
<h2>쿠키 값 확인하기</h2>
<p>처음 접속시 저장된 쿠키가 없는 경우 빈 페이지가 출력될 수 있다.</p>
<%
	// 요청 헤더에 저장된 쿠키를 받아 온다. (배열 타입)
	Cookie[] cookies = request.getCookies();
	if(cookies!=null){
		for(Cookie cookie:cookies){
			String cookieName = cookie.getName();
			String cookieValue = cookie.getValue();
			out.print("쿠키명: " + cookieName + "<br>쿠키값: " + cookieValue + "<br><br>");
		}
	}	
%>
</body>
</html>